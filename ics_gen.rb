require 'icalendar'
require 'byebug'
# Create a calendar with an event (standard method)
cal = Icalendar::Calendar.new

class Event
  attr_accessor :date, :summary
end


start_date = Time.new(2019,04,02)

def create_event(cal, str_date, summary)
  calendar_event = Icalendar::Event.new
  calendar_event.dtstart = Icalendar::Values::Date.new(str_date)
  calendar_event.summary = summary
  cal.add_event(calendar_event)
end

(10).times do |i|
  temp_date = start_date + i.day
  str_date = temp_date.strftime("%Y%m%d")

  if [0,1].include? i%9
    create_event(cal, str_date, 'Day')
  elsif [2,3].include? i%9
    create_event(cal, str_date, 'Night')
  end
end

File.open("test.ics", "w") {|f| f.write(cal.to_ical) }


