# frozen_string_literal: true

class TimeSlotDecorator < ApplicationDecorator
  delegate_all

  def opening_hours
    "#{time_slot.start_time.strftime(time_format)}-#{time_slot.end_time.strftime(time_format)}"
  end

  def time_format
    I18n.t('time_slots.format')
  end
end
