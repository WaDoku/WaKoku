require "rails_helper"

RSpec.feature "Admin can create a new entry", :type => :feature do
  let(:admin){ create :admin }
  before do
    @new_entry = {
      writing: "埴輪",
      kana: "はにわ",
      romaji: "haniwa",
      definition_de: "(„Tonringe“) Oberbegriff für Tonobjekte figürlicher und anderer Art, die um oder auf einem Grabhügel angeordnet bzw. aufgereiht sind;",
      definition_en: "Haniwa  ceramic clay figures placed on the surface of mounded tombs; ceramic funerary sculpture; haniwa",
      textbox_de: "Der Wandel des Grabhügel-Rituals lässt sich auch an den Tonfiguren, den Haniwa, ablesen, die auf den Grabhügeln aufgereiht standen. Auch unter den Haniwa, die nebeneinander standen, als würden sie einen heiligen Bezirk abgrenzen, erschienen neue Formen, die Geräte und Objekte nachbildeten. Zum Zeitpunkt der Einführung des Grabhügel-Rituals stellte man hausförmige Haniwa, die eine Wiedergabe des Haus des Verstorbenen zu seinen Lebzeiten sein könnten, direkt oberhalb der Bestattungsanlage auf und ordnete um sie herum Haniwa in Form von Köchern und Sonnenschirmen an. In der Mitte des 5. Jahrhunderts kamen Haniwa in Gestalt von Menschen und Tieren hinzu, und auf dem Grabhügel wurden verschiedene Szenen nachgestellt. Es gibt viele unterschiedliche Interpretationen dieser Szenen: Von einigen werden sie als Nachstellung des Nachfolgerituals des Oberhaupts oder des Bestattungsrituals gedeutet, andere sehen in ihnen Szenen aus dem Leben des Verstorbenen. In diesen Haniwa-Anordnungen kann man bereits keine Einheitlichkeit des Rituals mehr erkennen.",
      textbox_en: "The change of the burial mound ritual is also reflected in the clay figures, the haniwa, which were lined up on the burial mounds. Among the haniwa who stood next to each other as if they were defining an sacred precinct, appeared new forms, who reproduced implements and objects. At the time of introduction of the burial mound ritual they put house-shaped haniwa that might be in the lifetime of the deceased, a reproduction of his house, directly above the burial facility and arranged around it haniwa in the form of quivers and parasols on. In the middle of the 5th century new haniwa were added in the form of humans and animals, and on the burial mound different scenes were re-enacted. There are many different interpretations of these scenes: Some of them are interpreted as ritual reenactment of succession of the chief or the funeral ritual, others see them as scenes from the life of the deceased. In these haniwa arrangements there is already no uniformity of the ritual anymore.
        yokoanashiki sekishitsu よこあなしきせきしつ  横穴式石室  steinerne Grabkammer mit seitlichem, horizontalem (Korridor)Eingang (Mittel-/Spätkofun) corridor-style stone chamber with horizontal lateral (side) entrance; horizontal chamber; passage grave."
    }
    visit admin_log_in_path
    fill_in "email", with: admin.email
    fill_in "password", with: "1234"
    click_button "Submit"
  end

  scenario "Admin creates a new entry" do
    visit new_admin_entry_path
    expect(page).to have_text("Neuer Eintrag")

    @new_entry.each do |key, val|
      fill_in "entry_" + key.to_s, with: val
    end
    attach_file "entry_image", File.absolute_path("spec/fixtures/haniwa.svg")
    click_button "Speichern"

    expect(page).to have_text("Eintrag wurde erfolgreich erstellt!")
    expect(current_path).to eq admin_entry_path(Entry.last)

    expect(page).to have_text(@new_entry[:writing])
    expect(page).to have_text(@new_entry[:kana])
    expect(page).to have_text(@new_entry[:romaji])
    expect(page).to have_text(@new_entry[:definition_de])
    expect(page).to have_text(@new_entry[:definition_en])
    expect(page).to have_selector("img")

    expect(page).to have_content("Eintrag Editieren")
  end
end
