require "spec_helper"

describe ContactRequest do

  describe 'after create' do
    let(:email)       { Faker::Internet.email }
    subject(:contact) { create :contact_request, email: email }

    context "when there's a lead with the same email" do
      let!(:lead) { create :lead, email: email }
      it 'should attach the contact to a lead' do
        expect(contact.lead).to eq lead
      end
    end

    context "when there's NO lead with the same email" do
      it 'should attach the contact to a lead' do
        expect(contact.lead).to be_present
      end
    end
  end
end