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

    def part_one(down: 1, right: 3)
      h_index = 0
      v_index = 0
      tree_count = 0
      line_length = input_data[0].length

      while(v_index < input_data.length - 1)
        v_index += down
        h_index += right

        h_index = h_index >= line_length ? h_index - line_length : h_index
        tree_count += 1 if input_data[v_index][h_index] == "#"
      end
      tree_count
    end

    def part_two
      [
        part_one(right:1, down: 1),
        part_one(right:3, down: 1),
        part_one(right:5, down: 1),
        part_one(right:7, down: 1),
        part_one(right:1, down: 2),
      ].reduce(:*)
    end
  end
end
