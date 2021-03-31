# ## Descriptors
# 'first'
# 'second'
# 'third'
# 'fourth'
# 'fifth'
# 'last'
# 'teenth'

# ## Weekdays
# 'monday'
# 'tuesday'
# 'wednesday'
# 'thursday'
# 'friday'
# 'saturday'
# 'sunday'

# 1 -> 31
# 2 -> 28 / 29 -> leap year presented as 13 in dictionary
# 3 -> 31
# 4 -> 30
# 5 -> 31
# 6 -> 30
# 7 -> 31
# 8 -> 31
# 9 -> 30
# 10 -> 31
# 11 -> 30
# 12 -> 31

## leap? -> true/false ---> 365 / 366 days per year
## wday -> 0-6 (Sunday is 0)
## day -> returns the day of the month (1-31)


# - given day monday & first -> 1
# - given monday & second -> 1 + 7

# - e.g. you have march as a month -> 31 days
# - iteratre through each day -> check whether it fufills the condition of:
#   - being the weekday given, if it does then add the second condition in case it's not first
# - return the full day


# - Algorithm
# - given the month (hash key) -> iteration from 1 to up to hash value


require "Date"

DAYS_PER_MONTH = {
   1 => 31,
   2 => 28,
   3 => 31,
   4 => 30,
   5 => 31,
   6 => 30,
   7 => 31,
   8 => 31,
   9 => 30,
   10 => 31,
   11 => 30,
   12 => 31,
   13 => 29
}

WEEKDAYS = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
DESCRIPTORS = ['first', 'second', 'third', 'fourth', 'fifth', 'last', 'teenth']
TEENTHS = [13, 14, 15, 16, 17, 18, 19]

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    descriptor = descriptor.downcase
    day_arr = []
    day_num = 0
    
    iteration_times = Date.new(year).leap? && month == 2 ? DAYS_PER_MONTH[13] : DAYS_PER_MONTH[month]  
    (1..iteration_times).each do |day_of_month|
      date = Date.new(year, month, day_of_month)
      if date.wday == WEEKDAYS.index(weekday)
        day_arr << day_of_month 
      end
    end

    case DESCRIPTORS.index(descriptor)
    when 0 then day_num = day_arr[0]
    when 1 then day_num = day_arr[1]
    when 2 then day_num = day_arr[2]
    when 3 then day_num = day_arr[3]
    when 4 then day_num = day_arr[4]
    when 5 then day_num = day_arr.last
    when 6 then day_num = teenth(day_arr)
    end

    if day_num == nil
      return nil
    else
      Date.new(year, month, day_num)
    end
  end

  def teenth(array)
    day = 0
    array.each do |ele|
      day += ele if TEENTHS.include?(ele)
    end
    day
  end
end
