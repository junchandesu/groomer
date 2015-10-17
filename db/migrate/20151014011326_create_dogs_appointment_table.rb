class CreateDogsAppointmentTable < ActiveRecord::Migration
  def change
    create_table :appointments_dogs do |t|
    	t.references :dog 
    	t.references :appointment
    end
  end
end
