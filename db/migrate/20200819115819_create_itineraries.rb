class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer 'artwork1'
      t.integer 'artwork2'
      t.integer 'artwork3'
      t.integer 'artwork4'
      t.integer 'artwork5'
      t.integer 'artwork6'
      t.integer 'artwork7'

      t.integer 'user'
      
      t.timestamps
    end
  end
end
