class RenameUsersToAdmins < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :admins
  end
end
