class CreateVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccines do |t|
      t.string :description
      t.string :status
      t.string :dose
      t.string :typeDose
      t.string :createBy

      t.timestamps
    end
  end
end
