class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :source
      t.integer :user_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
