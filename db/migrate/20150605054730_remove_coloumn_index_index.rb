class RemoveColoumnIndexIndex < ActiveRecord::Migration
  def change

    remove_index :tracks, column: :column_index
  end
end
