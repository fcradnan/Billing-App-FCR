class CreateUsages < ActiveRecord::Migration[8.0]
  def change
    create_table :usages do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true
      t.integer :units_used
      t.date :usage_date

      t.timestamps
    end
  end
end
