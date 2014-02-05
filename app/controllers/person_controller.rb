class PersonController < ApplicationController
  def show
    @people = Tmdb::Person.detail(params[:id])
    @movies = Tmdb::Person.credits(params[:id])
  end
end
