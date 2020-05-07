class ImportsController < ApplicationController
  def new
  end

  def create
    area_id = 2
    save = false

  	data = RGeo::GeoJSON.decode(params[:import][:geojson])
  	problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }
    boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PolygonImpl) }

  	@objects = []

    ActiveRecord::Base.transaction do
    	problem_features.each do |feature|

        if feature["circuit"].present?
          circuit = Circuit.find_or_initialize_by(color: feature["circuit"], area_id: area_id)
        else
          circuit = nil
        end

        if feature["id"].present?
        	problem = Problem.find_or_initialize_by(id: feature["id"])
          puts "if:::1"
        elsif circuit && feature["circuitNumber"].present?
        	problem = Problem.find_or_initialize_by(circuit: circuit, circuit_number: feature["circuitNumber"], area_id: area_id)
          puts "if:::2"
        else
        	problem = Problem.new
          puts "if:::3"
        end

        problem.assign_attributes(
          area_id: area_id,
        	location: FACTORY.point(feature.geometry.x, feature.geometry.y),
        	name: feature["name"].presence,
          grade: feature["grade"].presence,
          circuit_number: feature["circuitNumber"].presence,
          steepness: feature["steepness"].presence || "other",
          height: feature["height"].presence,
        )

        problem.save! if save
        @objects << problem
      end

      boulder_features.each do |feature|
        boulder = Boulder.new(polygon: feature.geometry, area_id: area_id)

        boulder.save! if save
        @objects << boulder
      end
    end
  end
end
