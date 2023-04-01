class Semester < ApplicationRecord
  has_many :quarters
  has_many :student_semesters
  has_many :students, through: :student_semesters
end
