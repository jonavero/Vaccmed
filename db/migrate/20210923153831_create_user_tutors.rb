class CreateUserTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tutors do |t|
      t.references :role, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.string :identityCard
      t.string :email
      t.string :password_digest
      t.string :createdBy

      t.timestamps
    end
  end
end
