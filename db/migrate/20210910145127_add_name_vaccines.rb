class AddNameVaccines < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccines, :name, :string
  end
end
