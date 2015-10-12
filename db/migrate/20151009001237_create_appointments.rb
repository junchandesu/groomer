class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :app_date
      t.string :check_in_time
      t.string :telephone
      t.string :memo
      t.references :user, index: true, foreign_key: true
      t.references :dog, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
