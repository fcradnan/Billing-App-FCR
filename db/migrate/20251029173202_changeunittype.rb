class Changeunittype < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      change_table :features do |t|
        dir.up   { t.change :unit_price, :string }
      end
  end
  end
end
