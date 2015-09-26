require 'spec_helper'

describe ContactRequestsController, type: :controller do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, contact_request: attributes_for(:contact_request)
        }.to change(ContactRequest, :count).by(1)
      end

      it "redirect to new contact path" do
        post :create, contact_request: attributes_for(:contact_request)
        expect(response).to redirect_to new_contact_request_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact" do
        expect{
          post :create, contact_request: attributes_for(:invalid_contact_request)
        }.to_not change(ContactRequest, :count)
      end

      it "re-renders the new method with error message" do
        post :create, contact_request: attributes_for(:invalid_contact_request)
        response.should render_template :new
      end
    end
  end
end