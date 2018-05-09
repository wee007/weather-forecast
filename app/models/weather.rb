class Weather < ApplicationRecord
  has_one :location
  has_one :wind
  has_one :atmosphere
end
