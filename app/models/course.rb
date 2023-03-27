class Course < ApplicationRecord
  belongs_to :quarter
  belongs_to :category
end
