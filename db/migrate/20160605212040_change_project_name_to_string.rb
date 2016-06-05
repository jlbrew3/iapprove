class ChangeProjectNameToString < ActiveRecord::Migration
  def change
    change_column(:projects, :project_name, :string)
  end
end
