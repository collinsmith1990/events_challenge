class Event < ActiveRecord::Base
  belongs_to :track

  def self.during_event(time, column_index)
    Event.find_by_sql("select events.* from events LEFT OUTER JOIN tracks ON tracks.id = events.track_id WHERE events.start < #{time} AND events.finish > #{time} AND tracks.column_index = #{column_index}")    
#    Event.where("start < :time and :time <= finish", { time: time, column_index: column_index })
    #Event.where("start < :time and :time <= finish", { time: DateTime.new(2015, 8, 12, 7, 30) } )
  end
end
#Event.joins('left outer join tracks on tracks.id = events.track_id').where("start < :time and :time <= finish", { time: time, column_index: column_index })
#
