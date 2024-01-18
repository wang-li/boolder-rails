class Admin::ContributeController < Admin::BaseController
  def dashboard
    @areas_with_stats = Area.published.
      map{|a| OpenStruct.new(
          area: a, 
          ascents: a.problems.sum(:ascents),
          completion: 1 - a.problems.incomplete.sum(:ascents).to_f / a.problems.sum(:ascents).to_f,
          upcoming_completion: a.problems.joins(:contribution_requests).where(contribution_requests: { state: "open" }).sum(:ascents).to_f / a.problems.sum(:ascents).to_f
        )
      }.
      sort_by(&:ascents).reverse
  end
end
