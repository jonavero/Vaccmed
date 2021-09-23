class AddUserFromColaboradores < ActiveRecord::Migration[6.1]
  def change
    add_reference :colaboradors, :user, null: false, foreign_key: true,default:7
  end
end
