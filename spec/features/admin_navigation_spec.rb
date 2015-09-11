require "rails_helper"

RSpec.feature "Admin can navigate through the editing interface", type: :feature do
  let(:admin){ create :admin }
  let(:entry){ create :entry }
  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end

  scenario "Links in the navbar" do
    click_link "Alle Einträge"
    expect(current_path).to eq admin_entries_path
    click_link "Neuer Eintrag"
    expect(current_path).to eq new_admin_entry_path
    click_link "Icons Verwalten"
    expect(current_path).to eq admin_icons_path
    click_link "Exportieren"
    expect(page.response_headers['Content-Type']).to eq "text/plain; charset=utf-8"
  end

  scenario "Links in entry#index" do
    entry.reload
    visit admin_entries_path
    find(".hanging-indent").first("a").click
    expect(current_path).to eq admin_entry_path(entry)

    visit admin_entries_path
    page.all(".btn")[0].click
    expect(current_path).to eq admin_entry_references_path(entry)

    visit admin_entries_path
    page.all(".btn")[1].click
    expect(current_path).to eq edit_admin_entry_path(entry)

    visit admin_entries_path
    page.all(".btn")[2].click
    expect(page).to have_content "Eintrag wurde gelöscht!"
  end

  scenario "Links in entry#show" do
    visit admin_entry_path(entry)
    find(".btn-info").click
    expect(current_path).to eq admin_entry_references_path(entry)

    visit admin_entry_path(entry)
    find(".btn-primary").click
    expect(current_path).to eq edit_admin_entry_path(entry)

    visit admin_entry_path(entry)
    find(".btn-danger").click
    expect(current_path).to eq admin_entries_path
    expect(page).to have_content "Eintrag wurde gelöscht!"
  end

end
