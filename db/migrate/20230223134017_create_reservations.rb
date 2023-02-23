class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :doctor_id
      t.integer :user_id
      t.date :date
      t.text :details

      t.timestamps
    end
  end
end
