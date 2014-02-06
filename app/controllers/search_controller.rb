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
        mmatch = @movies[0] & @movies[1]
         @results = []
         mmatch.each do |overlapingMovie|
          mov = Tmdb::Movie.detail(overlapingMovie)
          @title = mov.title
          @link = mov.imdb_id
           @results << [@title, @link]
         end
   # binding.pry

           # mmatch.each do |results|
           #   puts results

       # end
       # end
     # end

      #
      #
      #
      #
      #   cast["cast"].each do |id|
      #     moviesId << m["id"]
      #   end
      # @movies << moviesId

        #  binding.pry
        # mmatch = @movies[0] & @movies[1]
        # @results = []
        # mmatch.each do |match|
          #db query by match id
      #     #push movie into results
      #   end
      #  end
      # end

    # Find movies that are duplicates in the @movies array and list those only

      # binding.pry
    # people.each do |person|






    @film = []
    params[:query].split(',').each do |movie|
      @film = @film + Tmdb::Movie.find(movie)
    end

  end
end
