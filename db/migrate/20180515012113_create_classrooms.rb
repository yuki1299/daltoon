class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :school
      t.string :slug
      t.string :code
    end
  end
end
