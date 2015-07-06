class FixColumnType < ActiveRecord::Migration
  def change
    rename_column :orders, :stata ,:state
  end
end
