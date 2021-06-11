class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :char_id, null: false
      t.string :name, null: false
      t.string :birthday
      t.string :occupation, array: true, default: []
      t.string :img
      t.string :status
      t.string :nickname
      t.integer :appearance, array: true, default: []
      t.string :portrayed
      t.string :category
      t.string :better_call_saul_appearance, array: true, default: []

      t.timestamps
    end
    add_index :characters, :char_id
    add_index :characters, :name
  end
end
