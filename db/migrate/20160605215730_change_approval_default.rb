class ChangeApprovalDefault < ActiveRecord::Migration
  def change
    change_column_default(:floorplans, :client_approved, false)
  end
end
