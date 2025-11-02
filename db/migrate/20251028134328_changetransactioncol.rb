class Changetransactioncol < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      change_table :transactions do |t|
        dir.up   { t.change :amount, :string }
        dir.down { t.change :amount, :decimal }
      end
  end
end
end
