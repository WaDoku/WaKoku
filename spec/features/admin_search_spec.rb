require "rails_helper"

RSpec.feature "Admin can search entries", type: :feature do
  let(:admin){ create :admin }
  before do
    @genshi = create :entry
    @haniwa = create :entry, writing: "埴輪", kana: "はにわ", romaji: "haniwa", definition_de: "(„Tonringe“) Oberbegriff für Tonobjekte figürlicher und anderer Art, die um oder auf einem Grabhügel angeordnet bzw. aufger    eiht sind;", definition_en: "Haniwa  ceramic clay figures placed on the surface of mounded tombs; ceramic funerary sculpture; haniwa"
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end

  scenario "Admin searches after given entries" do
    visit admin_entries_path + "?search=genshi"
    expect(page).to have_content "1 Treffer"
    expect(page).to have_content @genshi.writing
    expect(page).to have_content @genshi.kana
    visit admin_entries_path + "?search=haniwa"
    expect(page).to have_content "1 Treffer"
    expect(page).to have_content @haniwa.writing
    expect(page).to have_content @haniwa.kana
    visit admin_entries_path + "?search=hani"
    expect(page).to have_content "1 Treffer"
    expect(page).to have_content @haniwa.writing
    expect(page).to have_content @haniwa.kana
  end
end
