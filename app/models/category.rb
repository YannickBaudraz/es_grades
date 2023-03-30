class Category < ApplicationRecord
  belongs_to :category

  has_many :categories
  has_many :courses, dependent: :delete_all

  acts_as_nested_set
end
