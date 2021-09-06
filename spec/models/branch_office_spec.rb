require 'rails_helper'

RSpec.describe BranchOffice, type: :model do
  # association test
  # ensure Todo model has a 1:m relationship with the Item model
  #
  it {should have_many(:colaboradors).dependent(:destroy)}
  #
  # validations test
  # ensure columns title ande created_by are present before saving
  #
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:sector)}
  it {should validate_presence_of(:province)}
  it {should validate_presence_of(:state)}
  it {should validate_presence_of(:createBy)}

end
