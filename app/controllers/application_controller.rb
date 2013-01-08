class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setup_client
  def current_client_engine
    @current_client_engine ||= CLIENT_ENGINES.detect do |engine|
      engine::DOMAINS.include?(request.domain)
    end
  end

  def setup_client
    if current_client_engine
      prepend_view_path(current_client_engine.view_paths)
      I18n.locale = current_client_engine.locale
    else
      I18n.locale = :en
    end
  end
end
