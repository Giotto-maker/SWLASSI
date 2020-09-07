class ItineraryForeignKeyTowardsArtworks < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :artwork1, :artwork1_id
  end
end
