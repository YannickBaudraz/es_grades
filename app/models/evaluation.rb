class Evaluation < ApplicationRecord
  belongs_to :exam
  belongs_to :student
  belongs_to :teacher

  delegate :course, to: :exam
end
