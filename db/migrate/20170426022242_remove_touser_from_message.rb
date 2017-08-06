class RemoveTouserFromMessage < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :to_user_id, :string
  end
end
