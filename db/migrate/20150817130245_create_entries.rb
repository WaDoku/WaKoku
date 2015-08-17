class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :writing
      t.string :kana
      t.string :romaji
      t.string :definition_en
      t.string :definition_de
      t.string :definition_fr
      t.text :textbox_en
      t.text :textbox_de
      t.string :picture

      t.timestamps
    end
  end
end
