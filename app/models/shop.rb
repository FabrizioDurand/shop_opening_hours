class Shop < ApplicationRecord
  has_many :schedules, dependent: :destroy

  # Use of nested attributes to allows to save shop schedules attributes
  # through its associated parent (shop)
  accepts_nested_attributes_for :schedules

  validates :name, presence: true
end
