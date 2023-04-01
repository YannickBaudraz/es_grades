class City < ApplicationRecord
  has_many :people

  validates :name, presence: true
  validates :zip, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1000,
    less_than_or_equal_to: 9999
  }
end
