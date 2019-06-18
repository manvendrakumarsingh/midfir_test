class CreatePentings < ActiveRecord::Migration
  def change
    create_table :pentings do |t|
      t.string :image
      t.boolean :is_public,default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
