# frozen_string_literal: true
module ServingSeconds
  module Core
    def humanize(secs, prec = nil, format = nil)
      prec, format = format, prec if prec && !prec.is_a?(Numeric)

      format ||= :short
      prec   ||= 0

      humanized = []

      intervals.each_with_index do |interval, i|
        units = send(interval)
        next unless secs >= units || units == seconds

        return find(secs, i, prec, format) if format == :short

        next if secs == 0

        secs = add_time_for_interval(humanized, secs, units, i, format)
      end

      humanized.join ', '
    end

    private

    def find(secs, i, prec, format)
      units = send(intervals[i])
      x = (secs / units).round(prec)
      if i - 1 >= 0 && x * units >= send(intervals[i - 1])
        return find(x * units, i - 1, prec, format)
      end

      descriptor = intervals[i]
      descriptor = format == :short ? descriptor[0] : descriptor

      joiner = format == :short ? '' : ' '

      [x, descriptor].join joiner
    end

    def add_time_for_interval(array, secs, units, i, format)
      even = (secs / units).floor
      time = find(even * units, i, 0, format)
      array << (even == 1 ? time.chop : time)

      secs - units * even
    end

    def intervals
      @intervals ||= [
        :years,
        :weeks,
        :days,
        :hours,
        :minutes,
        :seconds,
      ]
    end

    def seconds
      @seconds ||= 1.to_f
    end

    def minutes
      @minutes ||= 60 * seconds
    end

    def hours
      @hours ||= 60 * minutes
    end

    def days
      @days ||= 24 * hours
    end

    def weeks
      @weeks ||= 7 * days
    end

    def years
      @years ||= 365 * days
    end
  end

  extend Core
end
