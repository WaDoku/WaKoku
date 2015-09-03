require "rails_helper"

RSpec.feature "Admin sessions management", :type => :feature do
  let(:admin){ create :admin }
  scenario "Admin login and logout with success" do
    visit admin_log_in_path
    expect(page).to have_text("Anmelden")

    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"

    expect(page).to have_text("Logged in!")
    expect(current_path).to eq admin_entries_path
    expect(page).to have_text(admin.email)

    click_link "Abmelden"
    expect(current_path).to eq root_path
  end

  scenario "Admin login fails" do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "4321"
    click_button "Submit"

    expect(page).to have_text("Invalid email or password")
  end

end
