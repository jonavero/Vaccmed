class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :role, null: false, foreign_key: true
      t.references :colaborador, null: false, foreign_key: true
      t.string :username
      t.string :password_digest
      t.string :createBy

      t.timestamps
    end
  end
end
