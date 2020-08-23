class ChangeUserAdmincreationColumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :admin_creations, :user, :user_id
  end
end
