class ItineraryForeignKeyTowardsArtworks2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork2, :artwork2_id
  end
end
