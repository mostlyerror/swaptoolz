class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :motel, foreign_key: true
      t.references :severe_weather_event, foreign_key: true
      t.integer :rooms

      t.timestamps
    end

    add_index :availabilities, [:motel_id, :severe_weather_event_id], unique: true
  end
end
