class CreateDependents < ActiveRecord::Migration[6.1]
  def change
    create_table :dependents do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true
      t.string :createdBy

      t.timestamps
    end
  end
end
