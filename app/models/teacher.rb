class Teacher < Person
  has_many :exams
  has_many :evaluations
  has_many :assignments
  has_many :courses, through: :assignments, dependent: :delete_all
end
