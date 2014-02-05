class ApplicationController < ActionController::Base
  require 'themoviedb'
  protect_from_forgery with: :exception


  before_filter :set_config
  Tmdb::Api.key("725e76ad499237551bbd1804bd35587a")

  def set_config
    @configuration = Tmdb::Configuration.new
  end
end
