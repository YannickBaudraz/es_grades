class Course < ApplicationRecord
  belongs_to :quarter
  belongs_to :category
  belongs_to :promotion

  has_many :assignments, dependent: :delete_all
  has_many :teachers, through: :assignments, foreign_key: :teacher_id, dependent: :delete_all
  has_many :exams, dependent: :delete_all
end
