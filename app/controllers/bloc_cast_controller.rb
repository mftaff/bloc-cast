class BlocCastController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :get_recommended_shows, only: [:index, :show, :search]

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
    
    if response.success?
      @search_results = response

      current_user.update_genre_list(@search_results["results"].first(7)) if current_user
    else
      flash[:alert] = "Uh oh! Something went wrong.."
    end
  end

  private

  def get_recommended_shows
    if current_user && !current_user.searched_genres.nil? # Signed in users will see a list of shows based on their search history
      @recommended_shows = HTTParty.get("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc&with_genres=#{current_user.most_searched_genres}")
    else # Guest users will see a shows created in the past year
      @recommended_shows = HTTParty.get("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc&first_air_date.gte=#{1.year.ago.strftime("%Y-%m-%d")}")
    end
  end
end
