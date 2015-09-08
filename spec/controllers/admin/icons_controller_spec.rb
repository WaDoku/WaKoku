require "rails_helper"

RSpec.describe Admin::IconsController, type: :controller do
  let(:admin){ create :admin }
  let(:icon){ create :icon }
  before do
    session[:admin_id] = admin.id
  end

  describe "GET index" do
    it "should render index view" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "should create new icon" do
      post :create, icon: { icon: fixture_file_upload("haniwa.svg") }
      expect(Icon.last.icon.name).to eq "haniwa.svg"
      expect(response).to redirect_to admin_icons_path
    end
  end
end
