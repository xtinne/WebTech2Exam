class CreateToDos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.date :ingavedatum
      t.date :einddatum
      t.integer :prioriteit
      t.string :beschrijving
      t.integer :status

      t.timestamps null: false
    end
  end
end
