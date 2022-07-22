# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :time_slots

  validates :name, presence: true

  def time_slot_for_day(day)
    time_slots.find_all { |ts| ts.day == day }
  end
end
