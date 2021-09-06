class AddEdadMaximaToVaccines < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccines, :edadMaxima, :integer
  end
end
