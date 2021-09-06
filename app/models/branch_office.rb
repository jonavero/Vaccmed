class BranchOffice < ApplicationRecord
  has_many :colaboradors, dependent: :destroy

  validates_presence_of :name,:sector,:state,:province,:createBy
end
