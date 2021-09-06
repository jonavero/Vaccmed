class CreateColaboradors < ActiveRecord::Migration[6.1]
  def change
    create_table :colaboradors do |t|
      t.string :names
      t.string :surname
      t.string :status
      t.string :email
      t.text :address
      t.references :branch_office, null: false, foreign_key: true
      t.string :createBy

      t.timestamps
    end
  end
end
