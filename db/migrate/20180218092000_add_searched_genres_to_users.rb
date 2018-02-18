class AddSearchedGenresToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :searched_genres, :string
  end
end
