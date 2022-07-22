# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  let(:shop) { Shop.new(name: 'Mon Super Shop') }
  subject do
    described_class.new(start_time: '08:30', end_time: '12:30', shop: shop, day: 'Monday')
  end

  it 'should be valid with right informations' do
    should be_valid
  end

  it 'should have an opening time before the closing date' do
    subject.start_time = '12:30'
    subject.end_time = '08:30'
    should be_invalid
  end

  it 'should have a opening time' do
    subject.start_time = nil
    should be_invalid
  end

  it 'should have a closed time' do
    subject.end_time = nil
    should be_invalid
  end

  it 'should have a valid day' do
    subject.day = 'foo_bar'
    should be_invalid
  end

  context 'should not have same hours slot twice' do
    it {
      should validate_uniqueness_of(:start_time).scoped_to(%i[shop_id
                                                              day])
    }
    it {
      should validate_uniqueness_of(:end_time).scoped_to(%i[shop_id
                                                            day])
    }
  end

  it 'should not have time slots that share same hours for a day' do
    subject.save
    another_time_slot = TimeSlot.new(start_time: '11:30', end_time: '15:30', shop: shop, day: 'Monday')

    expect(another_time_slot).to be_invalid
  end
end
