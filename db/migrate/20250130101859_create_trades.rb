class CreateTrades < ActiveRecord::Migration[7.2]
  def change
    create_table :trades do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :trade_type
      t.string :status
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
