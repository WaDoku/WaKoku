require "rails_helper"

RSpec.describe Admin::ReferencesController, type: :controller do
  let(:admin){ create :admin }
  let(:entry){ create :entry }
  let(:icon){ create :icon }
  before do
    session[:admin_id] = admin.id
  end

  describe "GET index" do
    it "should render index template" do
      get :index, entry_id: entry.id
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    it "should create a new reference" do
      post :create, entry_id: entry.id, reference: { name: "wiki", url: "www.wikidepia.de", icon_id: icon.id }
      expect(response).to redirect_to admin_entry_references_path(entry)
      entry.reload
      expect(entry.references.count).to eq 1
      expect(entry.references.first.name).to eq "wiki"
      expect(entry.references.first.url).to eq "www.wikidepia.de"
      expect(entry.references.first.icon).to eq icon
    end
  end

  describe "DELETE destroy" do
    let(:reference){ create :reference, entry: entry }
    it "should destroy the reference" do
      delete :destroy, entry_id: entry.id, id: reference.id
      expect(response).to redirect_to admin_entry_references_path(entry)
      entry.reload
      expect(entry.references.count).to eq 0
    end
  end
end
