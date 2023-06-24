class WelcomeController < ApplicationController
  layout false, only: [:soon]

  def index
    @popular_areas = Rails.cache.fetch("welcome/popular_areas", expires_in: 12.hours) do
      Area.published.any_tags(:popular).all.shuffle
    end
  end

  def root
    http_lang = extract_locale_from_accept_language_header
    logger.debug "HTTP_ACCEPT_LANGUAGE: #{http_lang}"

    preferred_locale = ([http_lang&.to_sym] & I18n.available_locales).first
    redirect_to root_localized_path(locale: preferred_locale || I18n.default_locale)
  end

  def problem_permalink
    problem = Problem.find(params[:id])
    redirect_to helpers.problem_friendly_path(problem)
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
    end
end
