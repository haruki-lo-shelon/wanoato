class AddImage5ToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :image5, :string
  end
end
