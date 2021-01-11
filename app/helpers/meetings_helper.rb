module MeetingsHelper
    def availability(meetings, index)
        if meetings.any?{|a| a.hour_start == index}
            meeting = meetings.select{|a| a.hour_start == index}
            return meeting[0].start_time
        else
            return 'Available'
        end
    end
end
