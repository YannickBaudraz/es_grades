class Exam < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  has_many :evaluations, dependent: :delete_all
end
