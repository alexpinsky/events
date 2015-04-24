require 'spec_helper'

describe EventsController, type: :controller do

  let(:current_user) { create(:user) }
  before(:each) { sign_in current_user }

  describe "POST create" do
    
  end

  describe "PUT update" do
    let(:event) { create(:event, user: current_user) }

    subject { put :update, id: event.id, event: event_params, format: :json }
    
    context "when JSON request" do
      let(:event_params) do
        { name: new_name }
      end

      describe "success" do
        let(:new_name) { 'new event' }
         
        it "should only update the fields which were passed" do
          old_name = event.name
          old_text = event.text_1
          result = subject
          parsed_result = JSON.parse result.body
          expect(result.code).to eq '200' 
          expect(parsed_result).to include 'message'
          event.reload
          expect(event.name).to eq new_name
          expect(event.text_1).to eq old_text
        end
      end

      describe "failure" do
        
        context "when update to already existing url" do
          let(:existing_url) { 'some_fake_url' }

          let!(:perv_event) { create(:event, url: existing_url) }

          let(:event_params) do
            { url: existing_url }
          end
      
          it "should return a bad request and an error message" do
            old_url = event.url
            result = subject
            parsed_result = JSON.parse result.body
            expect(result.code).to eq '400'
            expect(parsed_result).to include 'message'
            event.reload
            expect(event.url).to eq old_url 
          end
        end
      end
    end
  end
end
