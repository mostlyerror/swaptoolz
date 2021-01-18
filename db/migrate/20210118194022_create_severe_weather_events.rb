class CreateSevereWeatherEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :severe_weather_events do |t|
      t.date :start, null: false
      t.date :end
      t.timestamps
    end
  end
end
