class CreateVoucherApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :voucher_applications do |t|
      t.references :severe_weather_event, index: true
      t.references :user, index: true

      t.string :applicant_first_name
      t.string :applicant_last_name
      t.date :applicant_date_of_birth 
      t.string :applicant_gender

      t.timestamps
    end
  end
end
