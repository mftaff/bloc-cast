class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  serialize :searched_genres

  def update_genre_list(show_list)
    # Get list of searched_genres or a new hash and set default value to 0
    genre_count = self.searched_genres ||= Hash.new(0)
    genre_count.default = 0

    # Decrement older search results
    genre_count.each do |k,_|
      genre_count[k] = (genre_count[k] / 1.2).round(1)
      genre_count[k] = 0 if genre_count[k] < 0
    end

    # Update genre_count with new search results 
    show_list.each { |show| show["genre_ids"].each { |id| genre_count[id.to_s] += 1 } }

    # Save upates into user model
    self.update(searched_genres: genre_count)
  end

  def most_searched_genres
    # Return string of top 3 genre_ids in user search history
    if !self.searched_genres.nil?
      self.searched_genres.sort_by { |k,v| -v }.first(3).to_h.map {|k,v| k if v > 0.5}.join(',')
    else
      ""
    end
  end
end
