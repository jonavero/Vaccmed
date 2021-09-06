class Colaborador < ApplicationRecord
  belongs_to :branch_office

  validates_presence_of :names,:surname,:status,:email,:createBy

end
