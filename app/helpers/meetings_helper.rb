module MeetingsHelper

    def availability(meetings)

        available_array = []
        8.upto(17) do |count|
            available_array << count
        end

        meetings.each do |meet|
            available_array.delete(meet.start_time.hour)
        end

        return available_array
    end

end
