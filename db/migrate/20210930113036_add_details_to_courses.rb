class AddDetailsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :lat, :float
    add_column :courses, :lng, :float
  end
end
