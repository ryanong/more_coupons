Rails.application.routes.draw do
  scope :module => :group_on,
    :as => :group_on,
    :constraints => lambda { |request| GroupOn::Engine::DOMAINS.include?(request.domain) } do
      get "wtf" => "welcome#wtf"
      match "/" => 'welcome#index'
    end
end
