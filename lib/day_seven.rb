class DaySeven
  attr_accessor :input_data

  class << self
    def input_data
      @input_data ||= begin
        f = File.read('inputs/day_seven.txt')
        f.split("\n").each_with_object([]) do |rule, array|
          rule_hash = {}
          split_rule = rule.chop.split('contain').map(&:strip)
          rule_hash[:holding_bag] = split_rule[0].strip.sub(/ b\w+.$/, '')
          rule_hash[:held_bags] = split_rule[1].split(', ').map do |held_bag|
            {
              quantity: held_bag.slice!(/^\d+/),
              type: held_bag.strip.sub!(/ b\w+.$/, '')
            }
          end
          array << rule_hash
        end
      end
    end

    def part_one; end

    def part_two; end
  end
end
