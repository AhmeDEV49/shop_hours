# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, type: :model do
  subject do
    described_class.new(name: 'My Super Shop')
  end

  describe 'Associations' do
    it { should have_many(:time_slots) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
