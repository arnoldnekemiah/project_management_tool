class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :priority
      t.datetime :due_date
      t.references :project, null: false, foreign_key: true
      t.references :assignee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
