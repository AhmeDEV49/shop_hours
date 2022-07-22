# frozen_string_literal: true

class TimeSlot < ApplicationRecord
  belongs_to :shop

  validates_inclusion_of :day, in: Date::DAYNAMES
  validates :start_time, presence: true
  validates :start_time,
            uniqueness: { scope: %i[shop_id day] }
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :end_time,
            uniqueness: { scope: %i[shop_id day] }

  validate :prevent_time_slot_overlap

  private

  def prevent_time_slot_overlap
    any = TimeSlot.where(day: day).excluding(self).any? do |time_slot|
      (start_time..end_time).overlaps?(time_slot.start_time..time_slot.end_time)
    end

    errors.add(:base, message: I18n.t('time_slots.errors.overlap')) if any
  end
end
