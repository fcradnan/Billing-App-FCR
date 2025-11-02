class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type
      t.date :transaction_date

      t.timestamps
    end
  end
end
