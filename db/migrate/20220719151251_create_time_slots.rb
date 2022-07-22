# frozen_string_literal: true

class CreateTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :time_slots do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.references :shop
      t.timestamps
    end
  end
end
