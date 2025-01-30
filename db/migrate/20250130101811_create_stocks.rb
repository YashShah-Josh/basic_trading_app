class CreateStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.decimal :current_price
      t.decimal :previous_close
      t.decimal :day_high
      t.decimal :day_low
      t.decimal :change_percentage
      t.datetime :last_updated
      t.string :status

      t.timestamps
    end
  end
end
