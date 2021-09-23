class AddUserToTutors < ActiveRecord::Migration[6.1]
  def change
    add_reference :tutors, :user, null: false, foreign_key: true,default:7
  end
end
