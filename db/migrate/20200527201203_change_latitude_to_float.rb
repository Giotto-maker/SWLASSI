class ChangeLatitudeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :artworks, :latitudine, :float
  end
end
