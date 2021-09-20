class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.string :name
      t.string :createdBy

      t.timestamps
    end
  end
end
