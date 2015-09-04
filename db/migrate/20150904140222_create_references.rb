class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :url
      t.integer :icon_id

      t.timestamps
    end
  end
end
