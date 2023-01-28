require "rails_helper"

RSpec.describe PrescriptionsController, type: :routing do
  # before(:example) do
  #   @visit = build(:visit)
  #   @visit.save
  #   @prescription = build(:prescription , visit_id: @visit.id)
  #   @prescription.save
  # end

  describe "routing" do
    # it "routes to #index" do
    #   expect(:get => visit_prescriptions_path(:visit_id => @visit.id)).to route_to(:controller => "prescriptions", :action => "index", :visit_id => @visit.id.to_s)
    # end

    it 'routes to #index' do
      expect(get: '/visits/1/prescriptions').to route_to('prescriptions#index', visit_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/visits/1/prescriptions/1').to route_to('prescriptions#show', visit_id:'1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/visits/1/prescriptions').to route_to('prescriptions#create', visit_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/visits/1/prescriptions/1').to route_to('prescriptions#update', visit_id:'1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/visits/1/prescriptions/1').to route_to('prescriptions#update', visit_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/visits/1/prescriptions/1').to route_to('prescriptions#destroy', visit_id: '1', id: '1')
    end

    # it "routes to #post" do
    #   expect(:post => visit_prescriptions_path(:visit_id => @visit.id)).to route_to("prescriptions#create", :visit_id => @visit.id.to_s)
    # end


    # it "routes to #get" do
    #   expect(:get => visit_prescription_path(:visit_id => @visit.id, :id => @prescription.id)).to route_to("prescriptions#show", :visit_id => @visit.id.to_s, :id => @prescription.id.to_s)
    # end

    # it "routes to #update via PUT" do
    #   expect(:put => visit_prescription_path(:visit_id => @visit.id, :id => @prescription.id)).to route_to("prescriptions#update", :visit_id => @visit.id.to_s, :id => @prescription.id.to_s)
    # end

    # # it "routes to #update via PATCH" do
    # #   expect(patch: "/prescriptions/1").to route_to("prescriptions#update", id: "1")
    # # end

    # it "routes to #destroy" do
    #   expect(:delete => visit_prescription_path(:visit_id => @visit.id, :id => @prescription.id)).to route_to("prescriptions#destroy", :visit_id => @visit.id.to_s, :id => @prescription.id.to_s)
    # end
  end
end
