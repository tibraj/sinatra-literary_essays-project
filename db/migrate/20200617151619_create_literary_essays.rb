class CreateLiteraryEssays < ActiveRecord::Migration
  def change
    create_table :literary_essays do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
