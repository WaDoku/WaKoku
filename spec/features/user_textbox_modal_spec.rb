require "rails_helper"

RSpec.feature "User can read content in of textbox", type: :feature do

  before do
    @entry = Entry.create writing: "genshi", kana: "genshi", romaji: "genshi", textbox_de: "Das ist eine ausführliche Erklärung auf Deutsch", textbox_en: "the is a detailed explanation in English"
    visit root_path
    within ".content" do
      fill_in "search", with: "genshi"
    end
    click_button "Suchen!"
  end

  scenario "User activates textbox_de modal", js: true do
    expect(page).to have_content "mehr lesen"

    click_button "mehr lesen"
    expect(page).to have_text "Das ist eine ausführliche Erklärung auf Deutsch"
  end

  scenario "User activates textbox_en modal", js: true do
    expect(page).to have_content "read more"

    click_button "read more"
    expect(page).to have_text "the is a detailed explanation in English"
  end
end
