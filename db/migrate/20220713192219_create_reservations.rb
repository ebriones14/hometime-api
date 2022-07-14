class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :code
      t.date :start_date
      t.date :end_date
      t.integer :nights
      t.integer :guests
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.integer :status
      t.string :currency
      t.float :payout_price
      t.integer :security_price
      t.float :total_price

      t.timestamps
    end
  end
end
