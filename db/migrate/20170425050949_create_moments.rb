class CreateMoments < ActiveRecord::Migration[5.0]
  def change
    create_table :moments do |t|
      t.text :description

      t.timestamps
    end
  end
end
