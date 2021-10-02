require 'rgeo/geo_json'

namespace :josm do
  task export: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features = Problem.where(area_id: area_id).map do |problem|
      hash = {}.with_indifferent_access
      hash[:name] = problem.name_with_fallback
      hash[:problem_id] = problem.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    boulder_features = Boulder.where(area_id: area_id).map do |boulder|
      hash = {}.with_indifferent_access
      hash[:boulder_id] = boulder.id
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(boulder.polygon, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features + boulder_features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    file_name = Rails.root.join('export', "josm", "area-#{area_id}", "area-#{area_id}-data.geojson")

    raise "file already exists" if File.exist?(file_name)

    File.open(file_name,"w") do |f|
      f.write(geo_json)
    end

    puts "exported area-#{area_id}-data.geojson"
  end

  task metadata: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting metadata for area #{area_id}"

    geojson_factory = RGeo::GeoJSON::EntityFactory.instance
    features = []

    Topo.published.joins(:problems).merge(Problem.area(area_id)).each do |topo|
      hash = {}.with_indifferent_access

      hash[:name] = topo.problems.map(&:name_with_fallback).join(" | ")
      hash[:topo_id] = topo.id
      hash[:horizontal_accuracy] = topo.metadata_horizontal_accuracy.to_f.round(1)
      hash[:heading] = topo.metadata_heading.to_f.round(1)
      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      topo_location = FACTORY.point(
        topo.metadata_longitude, 
        topo.metadata_latitude
      )

      features << geojson_factory.feature(topo_location, nil, hash)

      next if topo.id==925 # FIXME: this topo doesn't have metadata
      heading = FACTORY.line_string([
        topo_location, 
        move_point(topo.metadata_longitude, topo.metadata_latitude, 3 * Math.cos(to_radian(topo.metadata_heading)), 3 * Math.sin(to_radian(topo.metadata_heading)))
      ])
      features << geojson_factory.feature(heading, nil, {})
    end

    feature_collection = geojson_factory.feature_collection(
      features
    )

    geo_json = JSON.pretty_generate(RGeo::GeoJSON.encode(feature_collection))

    File.open(Rails.root.join('export', "josm", "area-#{area_id}", "area-#{area_id}-metadata.geojson"),"w") do |f|
      f.write(geo_json)
    end

    puts "exported area-#{area_id}-metadata.geojson"
  end
end

def to_radian(degrees)
  Math::PI/2 - (degrees / 180 * Math::PI)
end

# https://stackoverflow.com/a/24688213/230309
def move_point(lon, lat, x_offset_meters, y_offset_meters)
  wgs84 = RGeo::Geographic.simple_mercator_factory.point(lon, lat)
  wgs84_factory = wgs84.factory
  webmercator = wgs84_factory.project wgs84
  webmercator_factory = webmercator.factory
  webmercator_moved = webmercator_factory.point(webmercator.x+x_offset_meters, webmercator.y+y_offset_meters)
  wgs84_factory.unproject webmercator_moved
end