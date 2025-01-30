class CreateSellers < ActiveRecord::Migration[7.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.decimal :target
      t.decimal :achieved
      t.decimal :commission
      t.string :status

      t.timestamps
    end
  end
end
