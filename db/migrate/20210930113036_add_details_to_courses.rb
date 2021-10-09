class AddDetailsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :lat, :float
    add_column :courses, :lng, :float
    add_column :courses, :lat2, :float
    add_column :courses, :lng2, :float
    add_column :courses, :lat3, :float
    add_column :courses, :lng3, :float
    add_column :courses, :lat4, :float
    add_column :courses, :lng4, :float
    add_column :courses, :lat5, :float
    add_column :courses, :lng5, :float
  end
end
