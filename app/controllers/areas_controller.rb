class AreasController < ApplicationController
  def index
    @areas = Area.order(:name).published

    @beginner_areas = Area.published.map{|a| [a, a.problems.where("grade < '4a'").count ]}.sort_by(&:second).reverse
    @intermediate_areas = Area.published.map{|a| [a, a.problems.where("grade >= '4a' AND grade < '6a'").count ]}.sort_by(&:second).reverse
    @advanced_areas = Area.published.map{|a| [a, a.problems.where("grade >= '6a'").count ]}.sort_by(&:second).reverse

    @annotations = @areas.map do |area| 
      {
        latitude: area.pois.first&.location&.latitude,
        longitude: area.pois.first&.location&.longitude,
        color: "#059669",
        title: area.name,
        glyphText: "",
      } 
    end
  end

  def show
    @area = Area.find(params[:id])

    @parkings = @area.pois

    @annotations = [
      {
        latitude: @area.pois.first&.location&.latitude,
        longitude: @area.pois.first&.location&.longitude,
        color: "#059669",
        title: @area.name,
        glyphText: "",
      } 
    ]
  end

  def map 
    @area = Area.find(params[:id])

    @parkings = @area.pois

    @annotation = {
      latitude: @parkings.first&.location&.latitude,
      longitude: @parkings.first&.location&.longitude,
      color: "#059669",
      title: @area.name,
      glyphText: "",
    } 

    @hide_nav = true
  end
end
