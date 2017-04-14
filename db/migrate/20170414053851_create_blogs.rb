class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.string :description
      t.integer :categry_id

      t.timestamps
    end
  end
end
