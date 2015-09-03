require "rails_helper"

RSpec.feature "Admin can edit an existing entry", type: :feature do
  let(:admin){ create :admin }
  let(:entry){ create :entry }

  before do
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end

  scenario "Admin edits an entry" do
    visit edit_admin_entry_path(entry)
    expect(page).to have_text("Eintrag Editieren")
    new_attributes = { "writing" => "new writing", "kana" => "new kana", "romaji" => "new romaji", "definition_de" => "new def", "definition_en" => "new def en", "definition_fr" => "french", "textbox_de" => "textbox_de", "textbox_en" => "textbox_en" }
    new_attributes.each do |key, val|
      fill_in "entry_" + key, with: val
    end
    attach_file "entry_image", File.absolute_path("spec/fixtures/haniwa.svg")
    click_button "Speichern"

    expect(page).to have_content("Eintrag wurde geändert!")
    expect(current_path).to eq admin_entry_path(entry)
    entry.reload
    new_attributes.each do |key, val|
      expect(entry[key]).to eq val
    end
  end

  scenario "Admin can delete the existing image in an entry" do
    entry.image = File.open("spec/fixtures/haniwa.svg")
    entry.save
    entry.reload
    visit edit_admin_entry_path(entry)
    expect(page).to have_text("Eintrag Editieren")
    expect(page).to have_selector("img")

    click_link "Bild löschen"
    expect(current_path).to eq edit_admin_entry_path(entry)
    expect(Entry.last.image).to be_nil
  end
end
