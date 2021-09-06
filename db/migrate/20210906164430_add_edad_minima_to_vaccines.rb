class AddEdadMinimaToVaccines < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccines, :edadMinima, :integer
  end
end
