require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiqq"

  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do 
      resources :areas, param: :slug do
        resources :problems, only: :index
        resources :tasks, only: :index
      end
      resources :problems, except: :index
      resources :imports
      resources :topos
      resources :problem_imports
      resources :lines
      resources :pois
      get "tasks/dashboard", to: "tasks#dashboard"

      root 'areas#index'
    end

    scope "articles" do
      scope "beginners-guide" do
        get '/', to: "articles#beginners_guide", as: :beginners_guide
        get 'equipment', to: "articles#equipment", as: :equipment
        get 'choose-area', to: "articles#choose_area", as: :choose_area
        get 'choose-problems', to: "articles#choose_problems", as: :choose_problems
        get 'climb-safely', to: "articles#climb_safely", as: :climb_safely
        get 'rules', to: "articles#rules", as: :rules
      end
      scope "top-areas" do
        get '/', to: redirect("/%{locale}/fontainebleau")
        get 'level', to: "articles#top_areas_level", as: :top_areas_level
        get 'train', to: "articles#top_areas_train", as: :top_areas_train
        get 'dry_fast', to: "articles#top_areas_dry_fast", as: :top_areas_dry_fast
        get 'groups', to: "articles#top_areas_groups", as: :top_areas_groups
      end
      root to: redirect("/%{locale}/articles/beginners-guide"), as: :articles
    end

    scope 'fontainebleau' do
      # ========================================================
      # Legacy routes: keep until end of 2021 for SEO purposes
      get "areas", to: redirect('/%{locale}/fontainebleau'), as: :area_legacy_redirect
      get "areas/:id", to: "welcome#redirect_area"
      get "areas/:id/map", to: "welcome#redirect_area_map"
      get "areas/:id/problems", to: "welcome#redirect_problems"
      # ========================================================
      get ":slug/problems", to: redirect('/%{locale}/fontainebleau/%{slug}'), as: :area_problems_legacy_redirect # keep until end of 2022

      get ":slug/:id", to: "problems#show", as: :area_problem, id: /\d.*/
      get ":slug/map", to: redirect('/%{locale}/map/%{slug}'), as: :map_area_legacy_redirect # keep until end of 2023
      get ":slug", to: "areas#show", as: :area
      get "/", to: "areas#index", as: :areas
    end
    
    get "problems/:id", to: "welcome#redirect_problem" # Legacy route: keep until end of 2021 for SEO purposes

    get 'map(/:slug)', to: 'map#index', as: :map
    get 'app', to: 'pages#app', as: :app
    get 'privacy', to: 'pages#privacy', as: :privacy

    resources :redirects, only: :new # useful for redirects where we only know the problem_id or area_id, eg. mapbox or algolia search

    # Permalinks (don't remove!)
    get '/p/:id', to: "welcome#problem_permalink" # used by the iPhone app
  end

  namespace :api do
      namespace :v1 do
        resources :topos, only: :show
      end
    end

  get '/:locale', to: 'welcome#index', locale: /#{I18n.available_locales.join('|')}/, as: :root_localized
  root to: 'welcome#root'
end
