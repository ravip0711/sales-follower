class AddAdminToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :admin, :boolean, default: false
  end
end
