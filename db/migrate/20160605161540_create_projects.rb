class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :notes
      t.string :project_status
      t.string :favorite_style
      t.integer :budget
      t.string :room_type
      t.integer :project_name

      t.timestamps

    end
  end
end
