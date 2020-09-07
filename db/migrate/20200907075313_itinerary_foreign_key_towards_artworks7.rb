class ItineraryForeignKeyTowardsArtworks7 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork7, :artwork7_id
  end
end
