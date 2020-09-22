class DropArListTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :ar_lists, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
