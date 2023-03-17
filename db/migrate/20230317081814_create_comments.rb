class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :project
      t.belongs_to :user

      t.text :message, null: false
      t.timestamps
    end
  end
end
