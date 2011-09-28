class AddLinkToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :link, :string
  end
end