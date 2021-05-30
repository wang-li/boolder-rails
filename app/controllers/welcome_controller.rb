class WelcomeController < ApplicationController
  layout false, only: [:soon]

  def index
    @beginner_areas = Area.published.reject{|a| a.id == 7}.
      map{|a| [a, a.problems.where("grade < '4a'").count ]}.
      sort_by(&:second).reverse
  end

  def root
    http_lang = extract_locale_from_accept_language_header
    logger.debug "HTTP_ACCEPT_LANGUAGE: #{http_lang}"

    preferred_locale = ([http_lang&.to_sym] & I18n.available_locales).first
    redirect_to root_localized_path(locale: preferred_locale || I18n.default_locale)
  end

  def boom
    raise "this is a test"
  end

  def redirect_area
    area = Area.find(params[:id])
    redirect_to area_path(area)
  end

  def redirect_area_map
    area = Area.find(params[:id])
    redirect_to map_area_path(area)
  end

  def redirect_problems
    area = Area.find(params[:id])
    redirect_to area_problems_path(area, level: params[:level], circuit_id: params[:circuit_id], featured: params[:featured])
  end

  def redirect_problem
    problem = Problem.find(params[:id])
    redirect_to area_problem_path(problem.area, problem)
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
    end
end
