class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :account_status
      t.string :kyc_status
      t.decimal :account_balance
      t.datetime :registration_date

      t.timestamps
    end
  end
end
