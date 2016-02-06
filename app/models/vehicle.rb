class Vehicle < ActiveRecord::Base
  belongs_to :type_of_vehicle
  belongs_to :agency
end
