class AddImage4ToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :image4, :string
  end
end
