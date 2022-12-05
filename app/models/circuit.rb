class Circuit < ApplicationRecord
  has_many :problems
  has_many :areas, -> { distinct }, through: :problems

  default_scope { order(order: :asc, id: :asc) }

  COLOR_VALUES = %w(yellow purple orange green blue skyblue salmon red black white)

  COLOR_VALUES.each do |color|
    scope color, -> { where(color: color) } 
  end

  validates :color, inclusion: { in: COLOR_VALUES }

  def sorted_problems
    problems.
      select{|p| p.location.present? }.
      sort_by{|p| p.circuit_number.to_i + (p.circuit_number.include?('b') ? 0.5 : 0) }
  end

  def name
      I18n.t("circuit.name.#{color}")
  end

  # TODO: implement with sensible logic
  def main_area
    areas.first
  end

  def avg_grade
    problems_with_grade = problems.select{|p| p.grade.in?(Problem::GRADE_VALUES)}
    grades_int = problems_with_grade.map{|p| Problem::GRADE_VALUES.index(p.grade) }
    avg_int = avg(grades_int).round
    Problem::GRADE_VALUES[avg_int]
  end

  def risky?
    avg_risk_score >= 4
  end

  def avg_risk_score
    problems_with_landing_and_height = problems.select{|p| p.landing.present? && p.height.present? }
    risk_scores =problems_with_landing_and_height.map{|p| p.risk_score }
    return 0 if risk_scores.count == 0
    avg(risk_scores).round(1)
  end


  private
  def avg(array)
    array.reduce(:+) / array.size.to_f
  end

  def median(array)
    return nil if array.empty?
    sorted = array.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end

end
