require 'spec_helper'

describe EventsController do

  describe "POST 'create'" do
    
    subject(:create) { post :create }
    
    context "when a category id is passed" do

      shared_examples "a edit of a new event" do

        it "should create a new event for the current user" do

        end

        it "should redirect to the edit_path for the new event" do

        end
      end

      context "when a template id is passed" do

        it_should_behave_like "a edit of a new event"
      end

      context "when a themplate id is NOT passed" do

        it_should_behave_like "a edit of a new event"
      end
    end
  end
end
