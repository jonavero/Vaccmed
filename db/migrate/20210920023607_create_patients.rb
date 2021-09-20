class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surname
      t.string :gender
      t.date :birthday
      t.string :createdBy

      t.timestamps
    end
  end
end
