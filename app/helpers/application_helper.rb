# frozen_string_literal: true

module ApplicationHelper
  def days_week_ordered_from_today
    today = Date::DAYNAMES.find_index(Date.today.strftime('%A'))

    Date::DAYNAMES[today..].map(&:to_s) + Date::DAYNAMES[0..today - 1]
  end

  def today?(day:)
    days_week_ordered_from_today.first == day
  end
end
