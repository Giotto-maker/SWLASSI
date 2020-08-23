class CreateLoverCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :lover_creations do |t|
      t.integer 'user_id'
      t.integer 'artwork_id'
      t.timestamps
    end
  end
end
