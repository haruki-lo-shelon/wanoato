class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.text :feature
      t.string :area

      t.timestamps
    end
  end
end
