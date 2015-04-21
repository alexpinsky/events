require 'spec_helper'

describe EventsController, type: :controller do

  let(:current_user) { create(:user) }
  before(:each) { sign_in current_user }

  describe "POST create" do
    
  end

  describe "PUT update" do
    let(:event) { create(:event, user: current_user) }
    
    context "when JSON request" do

      describe "success" do
        let(:new_name) { 'new event' }
         
        it "should only update the fields which were passed" do
          old_name = event.name
          old_text = event.text_1
          result = put :update, id: event.id, event: { name: new_name }, format: :json
          parsed_result = JSON.parse result.body
          expect(result.code).to eq '200' 
          expect(parsed_result).to include 'message'
          event.reload
          expect(event.name).to eq new_name
          expect(event.text_1).to eq old_text
        end
      end

      describe "failure" do
        
      end
    end
  end
end
