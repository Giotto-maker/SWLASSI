class ChangeArtworkAdmincreationColumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :admin_creations, :artwork, :artwork_id
  end
end
