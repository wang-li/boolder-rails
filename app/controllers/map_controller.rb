class MapController < ApplicationController
  layout "map"

  def index
    if params[:slug] && (area = Area.find_by(slug: params[:slug]))
      @area = area
      @bounds = { 
        south_west_lat: area.bounds[:south_west].lat,
        south_west_lon: area.bounds[:south_west].lon,
        north_east_lat: area.bounds[:north_east].lat,
        north_east_lon: area.bounds[:north_east].lon,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end

    if params[:pid] && (problem = Problem.find(params[:pid]))
      @problem = { 
        id: problem.id,
        lat: problem.location.lat,
        lon: problem.location.lon,
        name: I18n.with_locale(:fr) { problem.name_with_fallback },
        name_en: I18n.with_locale(:en) { problem.name_with_fallback },
        grade: problem.grade,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }
    end

    if params[:cid] && (circuit = Circuit.find(params[:cid]))
      @bounds = { 
        south_west_lat: circuit.bounds[:south_west].lat,
        south_west_lon: circuit.bounds[:south_west].lon,
        north_east_lat: circuit.bounds[:north_east].lat,
        north_east_lon: circuit.bounds[:north_east].lon,
      }.
      with_indifferent_access.deep_transform_keys { |key| key.camelize(:lower) }

      @circuit = { 
        id: circuit.id,
      }
    end
  end
end
