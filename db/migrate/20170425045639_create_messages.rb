class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :to_user_id
      t.integer :from_user_id
      t.text :message
      t.integer :image_url

      t.timestamps
    end
  end
end