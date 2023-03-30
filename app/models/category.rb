class Category < ApplicationRecord
  acts_as_nested_set

  has_many :courses, dependent: :delete_all
end
