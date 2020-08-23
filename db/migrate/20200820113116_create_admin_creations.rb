class CreateAdminCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_creations do |t|
      t.integer 'user'
      t.integer 'artwork'
      t.timestamps
    end
  end
end
