class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :icon_uid
      t.string :icon_name

      t.timestamps
    end
  end
end
