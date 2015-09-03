require "rails_helper"

RSpec.feature "Admin sessions management", :type => :feature do
  let(:admin){ create :admin }
  scenario "Admin login" do
    visit admin_log_in_path

    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"

    expect(page).to have_text("Logged in!")
    expect(current_path).to eq admin_entries_path
  end
end
