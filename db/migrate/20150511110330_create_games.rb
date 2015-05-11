class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :location
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
