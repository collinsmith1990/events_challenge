class EventsController < ApplicationController

  def index
    @tracks = Track.all.order(column_index: :asc)
    @events = Event.where("start < :date", { date: DateTime.new(2015, 8, 12, 11, 59, 59) })
  end
end
