class DaySix
  attr_accessor :input_data

  class << self
    def input_data
      @input_data ||= File.read('inputs/day_six.txt').split("\n\n").map do |answers|
        answers.split("\n")
      end
    end

    def part_one
      input_data.map { |survey| uniq_survey_analysis(survey) }.reduce(:+)
    end

    def part_two
      input_data.map { |survey| consensus_survey_analysis(survey) }.reduce(:+)
    end

    def uniq_survey_analysis(survey)
      survey.join.chars.uniq.count
    end

    def consensus_survey_analysis(survey)
      people_count = survey.count
      hash_table = {}
      survey.each do |person|
        person.chars.each { |c| hash_table[c] = hash_table[c].nil? ? 1 : hash_table[c] + 1 }
      end
      hash_table.select { |k,v| v == people_count }.keys.count
    end
  end
end