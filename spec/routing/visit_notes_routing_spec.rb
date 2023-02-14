require "rails_helper"

RSpec.describe VisitNotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/visit_notes").to route_to("visit_notes#index")
    end

    it "routes to #show" do
      expect(get: "/visit_notes/1").to route_to("visit_notes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/visit_notes").to route_to("visit_notes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/visit_notes/1").to route_to("visit_notes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/visit_notes/1").to route_to("visit_notes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/visit_notes/1").to route_to("visit_notes#destroy", id: "1")
    end
  end
end
