require 'rails_helper'

RSpec.describe Admin::EntriesController, type: :controller do
  let(:admin){ create :admin }
  let(:entry){ create :entry }
  before do
    session[:admin_id] = admin.id
    @new_entry = {
      writing: "埴輪",
      kana: "はにわ",
      romaji: "haniwa",
      definition_de: "(„Tonringe“) Oberbegriff für Tonobjekte figürlicher und anderer Art, die um oder auf einem Grabhügel angeordnet bzw. aufgereiht sind;",
      definition_en: "Haniwa  ceramic clay figures placed on the surface of mounded tombs; ceramic funerary sculpture; haniwa",
      textbox_de: "Der Wandel des Grabhügel-Rituals lässt sich auch an den Tonfiguren, den Haniwa, ablesen, die auf den Grabhügeln aufgereiht standen. Auch unter den Haniwa, die nebeneinander standen, als würden sie einen heiligen Bezirk abgrenzen, erschienen neue Formen, die Geräte und Objekte nachbildeten. Zum Zeitpunkt der Einführung des Grabhügel-Rituals stellte man hausförmige Haniwa, die eine Wiedergabe des Haus des Verstorbenen zu seinen Lebzeiten sein könnten, direkt oberhalb der Bestattungsanlage auf und ordnete um sie herum Haniwa in Form von Köchern und Sonnenschirmen an. In der Mitte des 5. Jahrhunderts kamen Haniwa in Gestalt von Menschen und Tieren hinzu, und auf dem Grabhügel wurden verschiedene Szenen nachgestellt. Es gibt viele unterschiedliche Interpretationen dieser Szenen: Von einigen werden sie als Nachstellung des Nachfolgerituals des Oberhaupts oder des Bestattungsrituals gedeutet, andere sehen in ihnen Szenen aus dem Leben des Verstorbenen. In diesen Haniwa-Anordnungen kann man bereits keine Einheitlichkeit des Rituals mehr erkennen.",
      textbox_en: "The change of the burial mound ritual is also reflected in the clay figures, the haniwa, which were lined up on the burial mounds. Among the haniwa who stood next to each other as if they were defining an sacred precinct, appeared new forms, who reproduced implements and objects. At the time of introduction of the burial mound ritual they put house-shaped haniwa that might be in the lifetime of the deceased, a reproduction of his house, directly above the burial facility and arranged around it haniwa in the form of quivers and parasols on. In the middle of the 5th century new haniwa were added in the form of humans and animals, and on the burial mound different scenes were re-enacted. There are many different interpretations of these scenes: Some of them are interpreted as ritual reenactment of succession of the chief or the funeral ritual, others see them as scenes from the life of the deceased. In these haniwa arrangements there is already no uniformity of the ritual anymore.
        yokoanashiki sekishitsu よこあなしきせきしつ  横穴式石室  steinerne Grabkammer mit seitlichem, horizontalem (Korridor)Eingang (Mittel-/Spätkofun) corridor-style stone chamber with horizontal lateral (side) entrance; horizontal chamber; passage grave.",
        image: fixture_file_upload("haniwa.svg", "image/svg")
    }
  end
  describe "GET index" do
    it "should render index" do
      get :index
      expect(response).to render_template(layout: "admin")
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "should render new" do
      get :new
      expect(response).to render_template(layout: "admin")
      expect(response).to render_template(:new)
    end
  end

  describe "GET show" do
    it "should render show" do
      get :show, id: entry.id
      expect(response).to render_template(:show)
    end
  end

  describe "PUT update" do
    it "should update entry" do
      put :update, id: entry.id, entry: @new_entry
      expect(Entry.last.writing).to eq @new_entry[:writing]
      expect(Entry.last.kana).to eq @new_entry[:kana]
      expect(Entry.last.romaji).to eq @new_entry[:romaji]
      expect(Entry.last.definition_de).to eq @new_entry[:definition_de]
      expect(Entry.last.definition_en).to eq @new_entry[:definition_en]
      expect(Entry.last.textbox_de).to eq @new_entry[:textbox_de]
      expect(Entry.last.textbox_en).to eq @new_entry[:textbox_en]
      expect(Entry.last.image.name).to eq "haniwa.svg"
    end
  end
  describe "POST create" do
    it "should create a new entry" do
      post :create, { entry: @new_entry }
      expect(Entry.last.writing).to eq @new_entry[:writing]
      expect(Entry.last.kana).to eq @new_entry[:kana]
      expect(Entry.last.romaji).to eq @new_entry[:romaji]
      expect(Entry.last.definition_de).to eq @new_entry[:definition_de]
      expect(Entry.last.definition_en).to eq @new_entry[:definition_en]
      expect(Entry.last.textbox_de).to eq @new_entry[:textbox_de]
      expect(Entry.last.textbox_en).to eq @new_entry[:textbox_en]
      expect(Entry.last.image.name).to eq "haniwa.svg"
    end
  end

  describe "DELETE destroy" do
    it "should delete an entry" do
      delete :destroy, id: entry.id
      expect(Entry.find_by_id(entry.id)).to be_nil
    end
  end

  describe "PUT delete image" do
    before do
      entry.image = fixture_file_upload("haniwa.svg")
      entry.save
    end
    it "should delete the image in the entry" do
      expect(entry.image).to_not be nil
      put :delete_image, id: entry.id
      expect(Entry.last.image).to be nil
    end
  end

end
