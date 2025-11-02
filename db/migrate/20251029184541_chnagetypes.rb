class Chnagetypes < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      change_table :features do |t|
        dir.up   { t.change :unit_price, :integer }
  end
   change_table :transactions do |t|
        dir.up   { t.change :amount, :integer }
      end
      change_table :transactions do |t|
        dir.up   { t.change :amount, :integer }
      end

       change_table :plans do |t|
        dir.up   { t.change :monthly_fee, :integer }
      end
end
end
end
