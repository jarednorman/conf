#!/usr/bin/env ruby

require 'pry'

class Breakdown
  class << self
    def call(days:, current_hours:, target_hours:)
      hours_per_day = (target_hours - current_hours) / days.length

      current_hours = round(current_hours)

      puts "Schedule:"
      puts "#########"
      puts "Start:\t#{current_hours}"

      days.each do |day|
        current_hours = round(current_hours + hours_per_day)
        puts "Day #{day}:\t#{current_hours}"
      end
    end

    def round(num)
      (num * 4).round / 4.0
    end
  end
end

# Breakdown.(days: (9..25).to_a, current_hours: 1.3, target_hours: 49.0)
# Breakdown.(days: (9..25).to_a, current_hours: 4.52, target_hours: 28.0)
Breakdown.(days: (9..25).to_a, current_hours: 5.6, target_hours: 32.0)
