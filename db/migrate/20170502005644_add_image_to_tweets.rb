class AddImageToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :image_url, :string
  end
end
