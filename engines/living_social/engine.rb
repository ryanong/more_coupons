module LivingSocial
  class Engine < ::Rails::Engine
    paths["app/engine_views"] = paths["app/views"]
    paths["app/views"] = []

    DOMAINS = [
      "livingsocial.com",
      "livingsocial.localhost"
    ]

    routes.draw do
      scope :module => :living_social,
        :as => :living_social,
        :constraints => lambda { |request| DOMAINS.include?(request.domain) } do
        resources :deals
      end
    end

    def self.locale
      :"EN-LIVINGSOCIAL"
    end

    I18n.fallbacks.map(self.locale => :en)
  end
end
