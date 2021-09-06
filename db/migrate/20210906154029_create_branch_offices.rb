class CreateBranchOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_offices do |t|
      t.string :name
      t.text :address
      t.string :sector
      t.string :province
      t.string :state
      t.string :createBy

      t.timestamps
    end
  end
end
