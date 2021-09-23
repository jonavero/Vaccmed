require "rails_helper"

RSpec.describe UserTutorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/user_tutors").to route_to("user_tutors#index")
    end

    it "routes to #show" do
      expect(:get => "/user_tutors/1").to route_to("user_tutors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/user_tutors").to route_to("user_tutors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_tutors/1").to route_to("user_tutors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_tutors/1").to route_to("user_tutors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_tutors/1").to route_to("user_tutors#destroy", :id => "1")
    end
  end
end
