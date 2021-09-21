class AppointmentDetail < ApplicationRecord
  belongs_to :appointment, optional: false
  belongs_to :vaccine
end
