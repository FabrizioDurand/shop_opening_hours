class Shop < ApplicationRecord
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules

  validates :name, presence: true
end
