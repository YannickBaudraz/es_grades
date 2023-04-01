class Promotion < ApplicationRecord
  has_many :student_promotions, dependent: :destroy
  has_many :students, through: :student_promotions
  has_many :courses, dependent: :destroy
end
