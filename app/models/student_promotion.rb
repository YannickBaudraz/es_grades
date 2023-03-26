class StudentPromotion < ApplicationRecord
  belongs_to :promotion
  belongs_to :student
end
