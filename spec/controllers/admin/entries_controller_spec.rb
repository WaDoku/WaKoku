require 'rails_helper'

RSpec.describe Admin::EntriesController, type: :controller do
  let(:admin){ create :admin }
  before do
    session[:admin_id] = admin.id
  end
  describe "GET index" do
    it "should render index" do
      get :index
      expect(response).to render_template(layout: "admin")
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "should render new" do
      get :new
      expect(response).to render_template(layout: "admin")
      expect(response).to render_template(:new)
    end
  end
end
