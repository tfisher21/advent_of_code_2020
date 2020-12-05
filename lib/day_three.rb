class DayThree
  class << self
    attr_reader :input_data

    def input_data
      @input_data ||= begin
        data = []
        File.open('challenge_inputs/day_three_inputs.txt').each_line do |l|
          data << l.strip
        end
        data
      end
    end

    def part_one
      r_index = 0
      v_index = 0
      tree_count = 0
      line_length = input_data[0].length

      while(v_index < input_data.length - 1)
        v_index += 1
        r_index += 3

        r_index = r_index >= line_length ? r_index - line_length : r_index
        tree_count += 1 if input_data[v_index][r_index] == "#"
      end
      tree_count
    end
  end
end
