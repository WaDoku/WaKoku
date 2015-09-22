require "rails_helper"

RSpec.feature "There should be special symbols in front of definition_de and definition_en", type: :feature do
  let!(:entry){ create :entry }
  let(:admin){ create :admin }

  scenario "User get special symbols displayed" do
    visit root_path
    within ".content" do
      fill_in "search", with: "genshi"
    end
    click_button "Suchen!"
    expect(page).to have_content "✦"
    expect(page).to have_content "♦︎"
  end

  scenario "Admin get special symbols displayed" do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"

    expect(page).to have_content "✦"
    expect(page).to have_content "♦︎"
  end
end
