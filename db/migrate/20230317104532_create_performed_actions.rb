class CreatePerformedActions < ActiveRecord::Migration[6.1]
  def change
    create_table :performed_actions do |t|
      t.references :subject, polymorphic: true
      t.string :action_type, null: false
      t.text :description

      t.timestamps
    end
  end
end
