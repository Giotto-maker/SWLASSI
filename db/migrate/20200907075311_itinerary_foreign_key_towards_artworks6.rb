class ItineraryForeignKeyTowardsArtworks6 < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork6, :artwork6_id
  end
end
