class AddImage3ToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :image3, :string
  end
end
