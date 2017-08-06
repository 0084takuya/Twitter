class RemoveFromuserFromMessage < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :from_user_id, :string
  end
end
