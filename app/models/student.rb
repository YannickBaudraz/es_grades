class Student < Person
  has_many :student_semesters
  has_many :semesters, through: :student_semesters
  has_many :student_promotions
  has_many :promotions, through: :student_promotions
  has_many :evaluations
  has_many :exams, through: :evaluations
  has_many :teachers, -> { distinct }, through: :evaluations
  has_many :courses , -> { distinct }, through: :exams
end
