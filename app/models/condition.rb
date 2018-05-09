class Condition < ApplicationRecord
  belongs_to :weather
  has_many :forecasts
end
