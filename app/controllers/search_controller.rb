class SearchController < ApplicationController

  def index
    @people = []
    params[:query].split(',').each do |person|
     @people = @people + Tmdb::Person.find(person)
    end
  end
end
