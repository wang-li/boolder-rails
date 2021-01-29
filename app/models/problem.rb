class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines
  has_many :topos, through: :lines

  STEEPNESS_VALUES = %w(wall slab overhang roof traverse other)
  GRADE_VALUES = %w(
    1a 1a+ 1b 1b+ 1c 1c+ 
    2a 2a+ 2b 2b+ 2c 2c+ 
    3a 3a+ 3b 3b+ 3c 3c+ 
    4a 4a+ 4b 4b+ 4c 4c+ 
    5a 5a+ 5b 5b+ 5c 5c+ 
    6a 6a+ 6b 6b+ 6c 6c+ 
    7a 7a+ 7b 7b+ 7c 7c+ 
    8a 8a+ 8b 8b+ 8c 8c+ 
    9a 9a+ 9b 9b+ 9c 9c+
  )
  LEVELS = %w(all level1 level2 level3 level4 level5 level6 level7 level8)

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true

  %i(yellow orange blue skyblue red white).each do |color|
  	scope color, -> { joins(:circuit).where(circuits: { color: color }) }	
  end

  scope :area, -> (area_id){ where(area_id: area_id) } 
  scope :number, -> (circuit_number){ where(circuit_number: circuit_number) } 

  scope :all_tags, -> (array){ where("tags @> ARRAY[?]::varchar[]", array) }
  scope :any_tags, -> (array){ where("tags && ARRAY[?]::varchar[]", array) }

  scope :level1, -> { where("grade < '2a'") }
  scope :level2, -> { where("grade >= '2a' AND grade < '3a'") }
  scope :level3, -> { where("grade >= '3a' AND grade < '4a'") }
  scope :level4, -> { where("grade >= '4a' AND grade < '5a'") }
  scope :level5, -> { where("grade >= '5a' AND grade < '6a'") }
  scope :level6, -> { where("grade >= '6a' AND grade < '7a'") }
  scope :level7, -> { where("grade >= '7a' AND grade < '8a'") }
  scope :level8, -> { where("grade >= '8a'") }

  def enumerable_circuit_number
    if circuit_number.present?
      circuit_number.to_i + (circuit_number.include?('b') ? 0.5 : 0)
    else
      1_000
    end
  end
end
