module EventsHelper

  def create_table_rows(events)
    time = events.minimum(:start)
    finish = events.maximum(:finish)
    html = String.new
    
    while(time < finish) do
      if time.min == 0
        html += "<tr rowspan='4'>"
        html += "<td>#{time}</td>"
        events_at_time(events, time).each do |event|
          html += "<td>#{event ? event.name : ""}</td>"
        end
        html += "</tr>"
      else
        html += "<tr>"
        events_at_time(events, time).each do |event|
          html += "<td>#{event ? event.name : ""}</td>"
        end
        html += "</tr>"
      end
        time = time + 15.minutes
    end
    html.html_safe
  end

  def events_at_time(events, time)
    events.where(start: time)
  end
end
