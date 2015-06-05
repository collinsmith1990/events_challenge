require 'csv'

task :import => [:environment] do

  file = "db/test_events.csv"
  column_index = 0

  CSV.foreach(file, :headers => true) do |row|
    if row[3] =~ /Track \d/
      track = Track.find_by(name: row[3])
      unless track
        track = Track.create(name: row[3], column_index: column_index)
        column_index += 1
      end
      Event.create(start: row[0], finish: row[1], name: row[2], track_id: track.id)
    else
      Event.create(start: row[0], finish: row[1], name: row[2])
    end
  end

end
