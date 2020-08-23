class ChangeUserItineraryColumnname < ActiveRecord::Migration[5.2]
  def change
    rename_column :itineraries, :user, :user_id
  end
end
