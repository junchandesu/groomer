class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.integer :weight
      t.string :breed
      t.boolean :mix
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
