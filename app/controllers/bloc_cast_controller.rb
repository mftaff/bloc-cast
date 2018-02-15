class BlocCastController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    response = HTTParty.get("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc")
    @popular_shows = response['results']
  end

  def show
  end

  def search
  end
end
