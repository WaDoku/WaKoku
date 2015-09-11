require "rails_helper"

RSpec.feature "Admin can export data", type: :feature do
  let(:admin){ create :admin }
  let!(:entry){ create :entry }
  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end

  scenario "Admin downloads tab file" do
    visit admin_data_export_path
    expect(page.response_headers['Content-Type']).to eq "text/plain; charset=utf-8"
    expect(page).to have_content entry.writing
    expect(page).to have_content entry.kana
    expect(page).to have_content entry.romaji
    expect(page).to have_content entry.definition_de
    expect(page).to have_content entry.definition_en
  end
end
