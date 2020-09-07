class ItineraryForeignKeyTowardsArtworks4 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork4, :artwork4_id
  end
end
