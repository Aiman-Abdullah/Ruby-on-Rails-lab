class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.references :section, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
