class AddNameToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :name, :string
  end
end
