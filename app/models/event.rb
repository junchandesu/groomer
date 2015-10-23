 def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :start => self.start_time,
      :end => self.end_time,
      :description => self.description,
      :allDay => self.is_all_day,
     }
     end