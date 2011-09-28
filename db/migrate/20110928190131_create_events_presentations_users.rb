class CreateEventsPresentationsUsers < ActiveRecord::Migration
  def up
    create_table :presentations do |t|
      t.string :topic
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
    end

    create_table :events do |t|
      t.datetime :planned_at
      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end

  def down
    drop_table :presentations
    drop_table :events
    drop_table :users
  end
end