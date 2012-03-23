class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body
      t.boolean :finished, default: false
      t.belongs_to :event
    end
  end
end
