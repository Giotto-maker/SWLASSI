class ItineraryForeignKeyTowardsArtworks5 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork5, :artwork5_id
  end
end
