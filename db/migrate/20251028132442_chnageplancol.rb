class Chnageplancol < ActiveRecord::Migration[8.0]
  def change
    reversible do |dir|
      change_table :plans do |t|
        dir.up   { t.change :monthly_fee, :string }
        dir.down { t.change :monthly_fee, :integer }
      end
    end
end
end
