class RenameUsernameToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :username, :name
  end
end
