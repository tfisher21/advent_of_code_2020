class DayFive
  attr_accessor :input_data

  class << self
    def input_data
      @input_data ||= File.read('inputs/day_five.txt').split("\n")
    end

    def part_one
      seat_ids(input_data).last
    end

    def part_two
      seat_ids = seat_ids(input_data)
      personal_seat_id = -1

      seat_ids.each_with_index do |item, index|
        next if index == 0 || index == seat_ids.length - 1
        unless item + 1 == seat_ids[index + 1]
          personal_seat_id = item + 1
        end

        unless item - 1 == seat_ids[index - 1]
          personal_seat_id = item - 1
        end
      end
      personal_seat_id
    end

    def seat_ids(tickets)
      tickets.each_with_object([]) { |item, array| array << seat_id(item) }.sort
    end

    def seat_id(ticket)
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
      (row.last * 8) + seat.last
    end
  end
end
