# This "require" line loads the contents of the 'date' file from the standard
# Ruby library, giving you access to the Date class.
require 'date'


def age_in_days(day, month, year)
  #TODO: return the age expressed in days given the day, month, and year of birth
  delta_year = Time.now.year - year
  delta_month = Time.now.month - month
  delta_day = Time.now.day - day

  age = delta_year * 365.25 + delta_month * 29.5 + delta_day
  age = age.to_i
end
