require 'rails_helper'

RSpec.describe "UserTutors", type: :request do
  describe "GET /user_tutors" do
    it "works! (now write some real specs)" do
      get user_tutors_path
      expect(response).to have_http_status(200)
    end
  end
end
