# frozen_string_literal: true

module Movies
  # Return individual movie
  class Show
    include Interactor

    def call
      context.movie = find_movie
    end

    private

    def find_movie
      BoxOfficeMojo::MovieSearchScraper.scrape(context.movie_params[:title])
    end
  end
end
