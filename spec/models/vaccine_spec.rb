require 'rails_helper'

RSpec.describe Vaccine, type: :model do
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:status)}
  it {should validate_presence_of(:dose)}
  it {should validate_presence_of(:typeDose)}
  it {should validate_presence_of(:createBy)}
  it {should validate_presence_of(:edadMinima)}
  it {should validate_presence_of(:edadMaxima)}

end
