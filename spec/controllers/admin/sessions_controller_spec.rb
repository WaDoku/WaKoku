require 'rails_helper'

RSpec.describe Admin::SessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    let(:admin){ create :admin }
    it "should create a new session" do
      post :create, email: admin.email, password: "1234"
      expect(session[:admin_id]).to eq admin.id
      expect(response).to redirect_to(admin_entries_path)
    end
  end

  describe "DELETE destroy" do
    let(:admin){ create :admin}
    it "should log out admin" do
      session[:admin_id] = admin.id
      delete :destroy
      expect(session[:admin_id]).to be_nil
    end
  end
end
