class SearchController < ApplicationController

  def index
    @people = []
    params[:query].split(',').each do |person|
      @people = @people + Tmdb::Person.find(person)
      @movies = []
      @people.each do |person|
        p = []
        p << Tmdb::Person.credits(person.id)
      end
    end
    # Find movies that are duplicates in the @movies array and list those only

      # binding.pry
    # people.each do |person|






    @film = []
    params[:query].split(',').each do |movie|
      @film = @film + Tmdb::Movie.find(movie)
    end

  end
end
