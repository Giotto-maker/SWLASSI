class AddTimestampToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :updated_at, :datetime, :default => DateTime.now
  end
end
