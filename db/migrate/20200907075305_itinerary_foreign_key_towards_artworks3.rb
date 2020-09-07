class ItineraryForeignKeyTowardsArtworks3 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork3, :artwork3_id
  end
end
