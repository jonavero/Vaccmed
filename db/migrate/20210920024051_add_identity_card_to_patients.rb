class AddIdentityCardToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :identityCard, :string
  end
end
