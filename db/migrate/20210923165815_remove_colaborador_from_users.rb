class RemoveColaboradorFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :colaborador, null: false, foreign_key: true
  end
end
