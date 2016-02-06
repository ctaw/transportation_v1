class TypeOfVehicle < ActiveRecord::Base
  has_many :vehicles
  has_many :fare
end
