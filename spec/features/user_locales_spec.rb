require "rails_helper"

RSpec.feature "User can change locales", type: :feature do
  scenario "user changes locales" do
    visit root_path
    expect(page).to have_content "Über Uns"
    expect(page).to have_content "Source code dieser Seite steht unter offenen Lizenzen(CC und AGPL) und findet sich auf GitHub."

    click_link "English"
    expect(page).to have_content "About Us"
    expect(page).to have_content "Source code of this page is subject to open licenses (CC and AGPL) and can be found on GitHub."

    click_link "日本語"
    expect(page).to have_content "案内"
    expect(page).to have_content "ソースコードタオープンライセンス (CC と AGPL) の支配を受ける。 Githubの上で見つけることができます。"
  end
end
