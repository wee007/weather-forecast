class Weather < ApplicationRecord
  has_one :location
  has_one :wind
end
