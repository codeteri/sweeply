class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :services
      t.string :size
      t.integer :bathrooms
      t.string :supplies
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
