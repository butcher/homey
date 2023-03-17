class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false, index: {unique: true}
      t.integer :status, null:false, default: 0

      t.timestamps
    end
  end
end
