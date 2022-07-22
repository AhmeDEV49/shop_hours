# frozen_string_literal: true

class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:time_slots)
  end
end
