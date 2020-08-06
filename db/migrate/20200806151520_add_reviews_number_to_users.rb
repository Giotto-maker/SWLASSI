class AddReviewsNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reviews_number, :integer, :default => 0
  end
end
