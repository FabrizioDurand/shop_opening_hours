class Schedule < ApplicationRecord
  belongs_to :shop

  WEEKDAYS = %w[lundi mardi mercredi jeudi vendredi samedi dimanche]
end
