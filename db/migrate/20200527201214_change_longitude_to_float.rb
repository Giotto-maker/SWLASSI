class ChangeLongitudeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :artworks, :longitudine, :float
  end
end
