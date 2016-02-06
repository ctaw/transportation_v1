class TypeOfVehicle < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :fare
end
