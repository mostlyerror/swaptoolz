class CreateMotels < ActiveRecord::Migration[6.0]
  def change
    create_table :motels do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
