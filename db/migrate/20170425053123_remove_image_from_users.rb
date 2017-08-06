class RemoveImageFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :image_url, :integer
  end
end
