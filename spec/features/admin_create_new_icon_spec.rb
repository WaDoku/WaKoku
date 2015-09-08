require "rails_helper"

RSpec.feature "Admin can create new icons", type: :feature do
  let(:admin){ create :admin }
  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end
  scenario "Admin creates new icon" do
    visit admin_icons_path
    attach_file "icon_icon", File.absolute_path("spec/fixtures/haniwa.svg")
    click_button "Upload"

    expect(page).to have_content "haniwa.svg"
  end
end
