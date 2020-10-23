class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :summary
      t.string :description
      t.integer :status, default: 0
      t.integer :assigned_to

      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :assigned_to

    add_index :tasks, :status
    add_index :tasks, :assigned_to
  end
end
