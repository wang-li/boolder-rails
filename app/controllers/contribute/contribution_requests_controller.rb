class Contribute::ContributionRequestsController < Contribute::BaseController
  def index
    @area = Area.find(params[:area_id])
    
    @requests = ContributionRequest.joins(:problem).
      where(problems: { area_id: @area.id }).
      where(what: "photo").
      # where("ascents >= ?", MIN_ASCENTS).
      order("ascents DESC NULLS LAST")
  end

  def dashboard
    @areas = Area.published.
      map{|a| OpenStruct.new(
          area: a, 
          count: a.problems.joins(:contribution_requests).where(contribution_requests: { what: "photo" }).count,
        )
      }.
      filter{|area_with_count| area_with_count.count > 0 }.
      sort_by(&:count).reverse
  end
end
