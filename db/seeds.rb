# frozen_string_literal: true

shop = Shop.create!(name: 'My super shop')

shop_slots = [
  TimeSlot.new(day: 'Wednesday', start_time: '10:30', end_time: '15:00'),
  TimeSlot.new(day: 'Wednesday', start_time: '17:00', end_time: '20:00'),
  TimeSlot.new(day: 'Thursday', start_time: '10:30', end_time: '15:00'),
  TimeSlot.new(day: 'Thursday', start_time: '17:00', end_time: '20:00'),
  TimeSlot.new(day: 'Friday', start_time: '10:30', end_time: '15:00'),
  TimeSlot.new(day: 'Friday', start_time: '17:00', end_time: '20:00'),
  TimeSlot.new(day: 'Saturday', start_time: '10:30', end_time: '20:00'),
  TimeSlot.new(day: 'Monday', start_time: '10:30', end_time: '15:00'),
  TimeSlot.new(day: 'Monday', start_time: '17:00', end_time: '20:00'),
  TimeSlot.new(day: 'Tuesday', start_time: '10:30', end_time: '15:00'),
  TimeSlot.new(day: 'Tuesday', start_time: '17:00', end_time: '20:00')
]

shop.time_slots << shop_slots
shop.save!
