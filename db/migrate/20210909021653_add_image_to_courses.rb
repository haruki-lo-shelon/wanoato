class AddImageToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :image, :string
    add_column :courses, :image2, :string
    add_column :courses, :image3, :string
    add_column :courses, :image4, :string
    add_column :courses, :image5, :string
  end
end
