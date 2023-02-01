class Schedule < ApplicationRecord
  belongs_to :shop

  WEEKDAYS = %w[lundi mardi mercredi jeudi vendredi samedi dimanche]

  # on vérifie si close coché -> ça passe
  # si horaire nil ou open>close et close non coché -> ça passe pas

  # Check close status, if checked validation pass.
  # If not, check that open_at < close_at
  validate :simple_opening_hour

  # Check multiple_slots status, if checked verification that open_at_ms < close_at_ms
  validate :multiple_opening_hour

  # Verification that multiple slots opening hours don't overlap
  validate :multiple_opening_hour_overlap

  private

  def simple_opening_hour
    return if closed

    if close_at <= open_at
      errors.add(:close_at, "Closing time cannot be before the opening time")
    end
  end

  def multiple_opening_hour
    return unless multiple_slots

    if close_at_ms <= open_at_ms
      errors.add(:close_at_ms, "Closing time cannot be before the opening time")
    end
  end

  def multiple_opening_hour_overlap
    return unless multiple_slots

    if open_at_ms < close_at
      errors.add(:open_at_ms, "Opening slots cannot overlap")
    end
  end
end
