class AddCreatedByToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :createdBy, :string
  end
end
