class Person < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city, optional: true

  has_many :person_roles, dependent: :destroy
  has_many :roles, through: :person_roles

  def full_name
    "#{first_name} #{last_name}"
  end

  def teacher?
    is_a?(Teacher)
  end

  def student?
    is_a?(Student)
  end
end
