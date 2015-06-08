class Event < ActiveRecord::Base
  belongs_to :track

  def self.during_event(time, column_index)
    Event.joins("LEFT OUTER JOIN tracks ON tracks.id = events.track_id").where("events.start < :time AND events.finish > :time AND (tracks.column_index = :column_index OR track_id IS NULL)", { time: time, column_index: column_index })    
  end
end
