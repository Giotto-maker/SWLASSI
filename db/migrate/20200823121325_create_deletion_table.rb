class CreateDeletionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :deletions do |t|
      t.integer 'user_id'
      t.integer 'artwork_id'
      t.timestamps
    end
  end
end
