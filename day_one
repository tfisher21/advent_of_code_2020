class DayOne
  class << self
    def expense_reports_2020(expense_report)
      expense_report.map!(&:to_i)
      sorted_er = expense_report.sort
      reverse_sorted_er = sorted_er.reverse

      valid_expense = sorted_er.find do |expense|
        reverse_sorted_er.any? { |rev_expense| rev_expense + expense == 2020 }
      end

      return valid_expense * (2020 - valid_expense)
    end

    def expense_reports_2020_two(expense_report)
      expense_report.map!(&:to_i)
      sorted_er = expense_report.sort

      second_expense = 0

      first_expense = sorted_er.find do |expense_one|
        remainder = 2020 - expense_one
        second_expense = sorted_er.find do |expense_two|
          next if expense_two == expense_one

          second_remainder = remainder - expense_two
          sorted_er.any? { |third_expense| second_remainder == third_expense }
        end
      end
      third_expense = 2020 - first_expense - second_expense
      return first_expense * second_expense * third_expense
    end
  end
end
