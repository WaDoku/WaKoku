require "rails_helper"

RSpec.feature "Admin creates new reference", type: :feature do
  let(:admin){ create :admin }
  let!(:icon){ create :icon }
  let!(:entry){ create :entry }
  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end
  scenario "Admin is able to go to references management page" do
    visit admin_entries_path
    expect(page).to have_content entry.writing
    page.first(".btn").click #reference button
    expect(current_path).to eq admin_entry_references_path(entry)
  end
  scenario "Admin can add a new reference to the entry" do
    visit admin_entry_references_path(entry)
    fill_in "reference_name", with: "ref"
    fill_in "reference_url", with: "www.google.com"
    page.select icon.icon.name, from: "reference_icon_id"
    click_button "Hinzufügen"

    expect(page).to have_content "ref"
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "wiki.png"

    entry.reload
    expect(entry.references.count).to eq 1

    visit admin_entries_path
    expect(page).to have_content "ref"
  end
end
