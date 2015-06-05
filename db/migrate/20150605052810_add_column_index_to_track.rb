class AddColumnIndexToTrack < ActiveRecord::Migration
  def change

    add_column :tracks, :column_index, :integer
    add_index :tracks, :column_index, :unique => true
  end
end
