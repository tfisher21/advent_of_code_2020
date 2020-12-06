class DayTwo
  class << self
    attr_reader :password_data

    def password_data
      @password_data ||= begin
        data = []
        File.open('inputs/day_two.txt').each_line do |l|
          data << l.chomp.split(/\s/)
        end
        data
      end
    end

    def part_one
      password_data.count do |data|
        quantity = data[0].split("-").map(&:to_i)
        range = Range.new(quantity[0], quantity[1])
        required_char = data[1].chop
        password = data[2]
        range.include? password.scan(/#{Regexp.quote(required_char)}{1}/).count
      end
    end

    def part_two
      password_data.count do |data|
        locations = data[0].split("-").map(&:to_i)
        required_char = data[1].chop
        password = data[2]
        location_one = password[locations[0] - 1] == required_char
        location_two = password[locations[1] - 1] == required_char

        location_one ^ location_two
      end
    end
  end
end
