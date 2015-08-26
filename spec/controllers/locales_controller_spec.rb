require 'rails_helper'

RSpec.describe LocalesController, :type => :controller do
  describe "POST change_locale" do
    it "should change locale" do
      post :change_locale, locale: 'en', current_path: root_path
      expect(response.cookies['locale']).to eq 'en'
    end
  end
end
