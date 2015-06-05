class AddTrackToEvents < ActiveRecord::Migration
  def change
    add_column :events, :track_id, :integer
  end
end
