class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :voto
      t.integer :valutazioni
      t.string :periodo
      t.string :nome
      t.string :indirizzo
      t.string :foto5
      t.string :foto4
      t.string :foto3
      t.string :foto2
      t.string :foto1
      t.string :autore
      t.string :dimensioni
      t.string :categoria
      t.decimal :latitudine
      t.decimal :longitudine

      t.timestamps
    end
  end
end
