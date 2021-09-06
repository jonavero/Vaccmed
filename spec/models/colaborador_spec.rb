require 'rails_helper'

RSpec.describe Colaborador, type: :model do

  it {should belong_to(:branch_office)}
  #
  # validations test
  # ensure columns title ande created_by are present before saving
  #
  it {should validate_presence_of(:names)}
  it {should validate_presence_of(:surname)}
  it {should validate_presence_of(:status)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:createBy)}
end
