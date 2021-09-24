class AddImage2ToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :image2, :string
  end
end
