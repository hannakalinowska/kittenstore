class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id

      t.string :attachment_file_name
      t.integer :attachment_file_size
      t.string :attachment_content_type

      t.string :status

      t.timestamps
    end
  end
end
