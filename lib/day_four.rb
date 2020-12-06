class DayFour
  REQUIRED_FIELDS = %i[byr iyr eyr hgt hcl ecl pid].freeze
  VALID_EYE_COLOR = %w[amb blu brn gry grn hzl oth].freeze

  class << self
    attr_reader :input_data

    def input_data
      @input_data ||= File.read('inputs/day_four.txt').split("\n\n").map do |l|
        l.gsub("\n", " ").strip.split(" ").each_with_object({}) do |i, h|
          field = i.split(":")
          h[field[0]] = field[1]
        end.transform_keys(&:to_sym)
      end
    end

    def part_one
      valid_passport_count = 0
      input_data.each do |passport_data|
        if required_fields_present?(passport_data)
          valid_passport_count += 1
        end
      end
      valid_passport_count
    end

    def part_two
      input_data.select do |passport_data|
        if required_fields_present?(passport_data)
          valid_byr?(passport_data[:byr]) &&
          valid_iyr?(passport_data[:iyr]) &&
          valid_eyr?(passport_data[:eyr]) &&
          valid_hgt?(passport_data[:hgt]) &&
          valid_hcl?(passport_data[:hcl]) &&
          valid_ecl?(passport_data[:ecl]) &&
          valid_pid?(passport_data[:pid])
        end
      end.count
    end

    def required_fields_present?(passport)
      REQUIRED_FIELDS & passport.keys == REQUIRED_FIELDS
    end

    def valid_byr?(byr)
      /\d{4}/.match?(byr) &&
      (1920..2002).include?(byr.to_i)
    end

    def valid_iyr?(iyr)
      /\d{4}/.match?(iyr) &&
      (2010..2020).include?(iyr.to_i)
    end

    def valid_eyr?(eyr)
      /\d{4}/.match?(eyr) &&
      (2020..2030).include?(eyr.to_i)
    end

    def valid_hgt?(hgt)
      if hgt.end_with?('cm')
        (150..193).include? hgt.slice(0..-3).to_i
      elsif hgt.end_with?('in')
        (59..76).include? hgt.slice(0..-3).to_i
      else
        false
      end
    end

    def valid_hcl?(hcl)
      /#\h{6}/.match?(hcl)
    end
    
    def valid_ecl?(ecl)
      VALID_EYE_COLOR.include? ecl
    end
    
    def valid_pid?(pid)
      /^\d{9}$/.match?(pid)
    end
  end
end
