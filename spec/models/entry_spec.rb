require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { should validate_presence_of(:writing) }
  it { should validate_presence_of(:kana) }

  describe "image" do
    let(:entry){ create :entry }

    it "should validate image size" do
      entry.image = File.open("spec/fixtures/haniwa.svg") #< 500kb
      expect(entry.save).to be true
      entry.image = File.open("spec/fixtures/komiketo.jpg") #> 500kb
      expect(entry.save).to be false
      expect(entry.errors.full_messages).to eq ["Image Datei überschreitet das Uploadlimit"]
    end

    it "should validate the mime_type of image" do
      entry.image = File.open("spec/fixtures/haniwa.svg")
      expect(entry.save).to be true
      entry.image = File.open("spec/fixtures/waterfall.png")
      expect(entry.save).to be true
      entry.image = File.open("spec/fixtures/PflichtenheftWaKoku.pdf")
      expect(entry.save).to be false
      expect(entry.errors.full_messages).to eq ["Image Format nicht zugelassen"]
    end
  end
end
