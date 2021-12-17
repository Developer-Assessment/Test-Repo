class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.date :booking_date
      t.time :from_time
      t.time :to_time
      t.integer :status

      t.timestamps
    end
  end
end
