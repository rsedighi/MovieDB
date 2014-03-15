class SearchController < ApplicationController

  def index
    @people = []
    params[:query].split(',').each do |person|
      @people = @people + Tmdb::Person.find(person)
    end
    @movies = []
    @people.each do |person|
      moviesId = []
      cast = Tmdb::Person.credits(person.id)
          # puts cast["cast"]
      cast["cast"].each do |m|
        moviesId << m["id"]
      end
        @movies << moviesId
    end
        if @people.length > 1
          mmatch = @movies[0] & @movies[1]
        else
          mmatch = @movies.first
        end
         @results = []
         mmatch.each do |overlapingMovie|
          mov = Tmdb::Movie.detail(overlapingMovie)
          # binding.pry
          @title = mov.title
          @link = mov.imdb_id
          @poster = mov.poster_path
          @results << [@title, @link, @poster]
         end

    # binding.pry

    @film = []
    params[:query].split(',').each do |movie|
      @film = @film + Tmdb::Movie.find(movie)
    end

  end
end
