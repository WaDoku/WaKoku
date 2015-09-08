require "rails_helper"

RSpec.feature "Admin can delete references from an entry", type: :feature do
  let(:admin){ create :admin }
  let!(:entry){ create :entry }
  let!(:ref){ create :reference, entry: entry }
  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end
  scenario "Admin deletes reference" do
    visit admin_entry_references_path(entry)
    expect(page).to have_content ref.name
    expect(page).to have_content ref.url

    click_link "Löschen"

    entry.reload
    expect(entry.references.count).to eq 0
  end
end
