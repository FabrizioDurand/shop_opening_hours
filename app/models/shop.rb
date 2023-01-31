class Shop < ApplicationRecord
  has_many :schedules
  accepts_nested_attributes_for :schedules

  validates :name, presence: true
end
