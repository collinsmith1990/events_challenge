class RemoveTrackColFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :track, :string
  end
end
