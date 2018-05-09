class Weather < ApplicationRecord
  has_one :location
  has_one :wind
  has_one :atmosphere
  has_one :astronomy
  has_one :condition
end
