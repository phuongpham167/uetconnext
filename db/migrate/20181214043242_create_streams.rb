class CreateStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :streams do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :session_id

      t.timestamps
    end
  end
end
