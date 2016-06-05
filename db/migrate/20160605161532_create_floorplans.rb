class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.string :image
      t.boolean :client_approved
      t.integer :project_id

      t.timestamps

    end
  end
end
