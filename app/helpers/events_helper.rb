module EventsHelper

  def create_table_rows(events, tracks)
    time = events.minimum(:start)
    finish = events.maximum(:finish)
    html = String.new
    
    while(time < finish) do
      if time.min == 0
        html += "<tr>"
        html += "<td rowspan='4'>#{time}</td>"
        html += create_events_row(events_at_time(events, time), tracks.count, time)
        html += "</tr>"
      else
        html += "<tr>"
        html += create_events_row(events_at_time(events, time), tracks.count, time)
        html += "</tr>"
      end
        time = time + 15.minutes
    end
    html.html_safe
  end

  def create_events_row(events, col_count, time)
    html = ""
    cells = Array.new(col_count)
    events.each do |event|
      if event.try(:track)
        cells[event.track.column_index] = "<td class='info'>#{event.name}</td>"
      else
        return html += "<td class='warning' colspan='5'>#{event.name}</td>"
      end
    end

    cells.each_with_index do |cell, index|
      if cell
        html += cell
      else
        current_event = Event.during_event(time, index)
        if current_event.first.try(:start)
          if current_event.first.track_id
            html += "<td class='info'></td>"
          else
            html += "<td class='warning'></td>"
          end
        else
          html += "<td></td>"
        end
      end
    end
    return html
  end

  def events_at_time(events, time)
    events.where(start: time)
  end
end
