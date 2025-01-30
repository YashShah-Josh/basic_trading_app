class CreateMarketTrends < ActiveRecord::Migration[7.2]
  def change
    create_table :market_trends do |t|
      t.references :stock, null: false, foreign_key: true
      t.decimal :opening_price
      t.decimal :closing_price
      t.integer :volume
      t.date :trend_date
      t.string :trend_type

      t.timestamps
    end
  end
end
