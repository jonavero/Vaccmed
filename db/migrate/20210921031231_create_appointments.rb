class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :branch_office, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.string :status
      t.string :createdBy
      t.datetime :cancelAt

      t.timestamps
    end
  end
end
