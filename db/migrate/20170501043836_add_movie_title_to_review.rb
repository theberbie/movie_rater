class AddMovieTitleToReview < ActiveRecord::Migration[5.0]
  def change
  	add_column :reviews, :movie_title, :string
  end
end
