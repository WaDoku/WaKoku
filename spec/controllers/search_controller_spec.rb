require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "GET index" do
    let(:entry){ create :entry }
    it "should search given entry, return results and number of hits" do
      get :index, search: "genshi"
      expect(response).to render_template(:index)
    end
  end
end
