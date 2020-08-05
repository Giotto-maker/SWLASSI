class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer 'valutation'
      t.text 'comment'
      t.references 'user'
      t.references 'artwork'
    end
  end
end
