class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :status
      t.date :date

      t.timestamps null: false
    end
  end
end
