# This "require" line loads the contents of the "date" file from the standard
# Ruby library, giving you access to the Date class.
require "date"

def age_in_days(day, month, year)
  # TODO: return the age expressed in days given the day, month, and year of birth
  birthdate = Date.new(year, month, day)

  today_date = Date.today

  age_days = (today_date - birthdate).to_i

  return age_days
end
