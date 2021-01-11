module MeetingsHelper
    def availability(meetings)
        available = {
            8 => true,
            9 => true,
            10 => true,
            11 => true,
            12 => true,
            13 => true,
            14 => true,
            15 => true,
            16 => true,
            17 => true
        }
        meetings.each do |meet|
            available[meet.start_time.hour] = false
        end
        return available
    end
end
