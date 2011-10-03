class AddOmniauthForUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.rename :first_name, :name
      t.remove :last_name
      t.string :uid
    end
  end

  def down
    change_table :users do |t|
      t.rename :name, :first_name
      t.string :last_name
      t.remove :uid
    end
  end
end