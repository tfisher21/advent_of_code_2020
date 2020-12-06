class DayFive
  attr_accessor :input_data

  class << self
    def input_data
      @input_data ||= File.read('challenge_inputs/day_five_input.txt').split("\n")
    end

    def part_one
      highest_seat_id(input_data)
    end

    def highest_seat_id(tickets)
      seat_ids = []
      tickets.each do |ticket|
        row = (0..127)
        seat = (0..7)
        
        ticket.each_char do |c|
          if c.upcase == "F"
            row = Range.new(row.first, row.last - row.size / 2)
          elsif c.upcase == "B"
            row = Range.new(row.first + row.size / 2, row.last)
          elsif c.upcase == "L"
            seat = Range.new(seat.first, seat.last - seat.size / 2)
          elsif c.upcase == "R"
            seat = Range.new(seat.first + seat.size / 2, seat.last)
          else
            raise RuntimeError, "invalid input_data #{ticket}:#{c}"
          end
        end
        seat_ids << (row.last * 8) + seat.last
      end
      seat_ids.sort.last
    end
  end
end
