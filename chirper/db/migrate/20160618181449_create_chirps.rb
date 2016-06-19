class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.string :author
      t.string :message

      t.timestamps null: false
    end
  end
end
