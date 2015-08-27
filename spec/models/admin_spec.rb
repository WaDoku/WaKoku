require 'rails_helper'

RSpec.describe Admin, :type => :model do
  describe "authenticate" do
    let!(:admin){ create(:admin, email: "admin@test.de") }
    it "should authenticate admin" do
      expect(Admin.authenticate(admin.email, "1234")).to eq admin
      expect(Admin.authenticate(admin.email, "4321")).to be_nil
    end
  end
end
