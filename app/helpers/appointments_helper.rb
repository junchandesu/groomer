module AppointmentsHelper


#only allow to choose the certain times
def am_hour_select(field_name)
  select_tag(field_name,options_for_select([
  [Time.now, "01"], ["9:00", "02"],["9:00", "03"],["9:30", "04"]]))
end


end
