require "rails_helper"

RSpec.describe PrescriptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/visit_prescriptions_path").to route_to("prescriptions#index")
    end

    # it "routes to #show" do
    #   expect(get: "/prescriptions/1").to route_to("prescriptions#show", id: "1")
    # end


    # it "routes to #create" do
    #   expect(post: "/prescriptions").to route_to("prescriptions#create")
    # end

    # it "routes to #update via PUT" do
    #   expect(put: "/prescriptions/1").to route_to("prescriptions#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/prescriptions/1").to route_to("prescriptions#update", id: "1")
    # end

    # it "routes to #destroy" do
    #   expect(delete: "/prescriptions/1").to route_to("prescriptions#destroy", id: "1")
    # end
  end
end
