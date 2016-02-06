class Fare < ActiveRecord::Base
  has_many :type_of_vehicles
end
