module ScheduleHelper
  def jours
    {
      lundi: 0,
      mardi: 1,
      mercredi: 2,
      jeudi: 3,
      vendredi: 4,
      samedi: 5,
      dimanche: 6
    }
  end

  def days
    {
      monday: 0,
      tuesday: 1,
      wednesday: 2,
      thursday: 3,
      friday: 4,
      saturday: 5,
      sunday: 6
    }
  end

  def today
    Time.now.strftime("%A").downcase
  end
end
