class ChangeDesignerDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :designer, false)
  end
end
