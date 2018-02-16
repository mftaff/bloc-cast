class BlocCastController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    response = HTTParty.get("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc")
    @popular_shows = response['results']
  end

  def show
    response = HTTParty.get("https://api.themoviedb.org/3/tv/#{params[:tv_id]}?api_key=#{ENV["TMDB_API_KEY"]}")
    @tv_show = response
  end

  def search
    response = HTTParty.get("https://api.themoviedb.org/3/search/tv?api_key=#{ENV["TMDB_API_KEY"]}&query=#{URI.encode params[:query].to_s}")
    @search_results = response
  end
end
