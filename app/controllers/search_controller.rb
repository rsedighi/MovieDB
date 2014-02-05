class SearchController < ApplicationController

  def index
    @movie = Tmdb::Movie.find(params[:query])
    @person = Tmdb::Person.find(params[:query])
  end
end
