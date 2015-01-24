require 'rails_helper'

RSpec.describe CertificationsController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in user
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "should create a new certification" do
        expect {
          post :create, certification: FactoryGirl.attributes_for(:certification), format: 'js'
        }.to change(Certification, :count).by(1)
      end

      it "renders the created certification partial" do
        post :create, certification: FactoryGirl.attributes_for(:certification), format: 'js'
        expect(response).to render_template :create
      end
    end

    context "with invalid attributes" do
      it "should not create a new certification" do
        expect {
          post :create, certification: FactoryGirl.attributes_for(:invalid_certification), format: 'js'
        }.to change(Certification, :count).by(0)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @certification = FactoryGirl.create(:certification)
    end

    it "deletes the certification" do
      expect {
        delete :destroy, id: @certification, format: 'js'
      }.to change(Certification, :count).by(-1)
    end

    it "renders the deleted certification partial" do
      delete :destroy, id: @certification, format: 'js'
      expect(response).to render_template :destroy
    end
  end
end
