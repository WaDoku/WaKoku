require "rails_helper"

RSpec.feature "User can search entries", type: :feature do
  before do
    @genshi = create :entry
    @haniwa = create :entry, writing: "埴輪", kana: "はにわ", romaji: "haniwa", definition_de: "(„Tonringe“) Oberbegriff für Tonobjekte figürlicher und anderer Art, die um oder auf einem Grabhügel angeordnet bzw. aufger    eiht sind;", definition_en: "Haniwa  ceramic clay figures placed on the surface of mounded tombs; ceramic funerary sculpture; haniwa"
  end
  scenario "User searches after given entries" do
    visit root_path
    within ".content" do
      fill_in "search", with: "genshi"
    end
    click_button "Suchen!"

    expect(page).to have_content "Suchergebnisse 1 Treffer"
    expect(page).to have_content @genshi.writing

    visit root_path
    within ".content" do
      fill_in "search", with: "haniwa"
    end
    click_button "Suchen!"

    expect(page).to have_content "Suchergebnisse 1 Treffer"
    expect(page).to have_content @haniwa.writing

    #partial match for kanji, romaji and kana
    visit root_path
    within ".content" do
      fill_in "search", with: "埴"
    end
    click_button "Suchen!"

    expect(page).to have_content "Suchergebnisse 1 Treffer"
    expect(page).to have_content @haniwa.writing

    visit root_path
    within ".content" do
      fill_in "search", with: "はに"
    end
    click_button "Suchen!"

    expect(page).to have_content "Suchergebnisse 1 Treffer"
    expect(page).to have_content @haniwa.writing
  end

  scenario "User send empty search request" do
    visit root_path
    click_button "Suchen!"
    expect(page).to have_content "Suchergebnisse 0 Treffer"
  end
end
