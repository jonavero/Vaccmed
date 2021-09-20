class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :surname
      t.string :documentType
      t.string :identityCard
      t.string :email
      t.string :gender
      t.date :birthday
      t.string :phone
      t.string :telephone
      t.string :workTelephone
      t.string :address

      t.timestamps
    end
  end
end
