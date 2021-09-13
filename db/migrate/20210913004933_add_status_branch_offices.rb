class AddStatusBranchOffices < ActiveRecord::Migration[6.1]
  def change
    add_column :branch_offices, :status, :string
  end
end
