class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
