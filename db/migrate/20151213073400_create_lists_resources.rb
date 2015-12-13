class CreateListsResources < ActiveRecord::Migration
  def change
    create_table :lists_resources do |t|
      t.integer :list_id
      t.integer :resource_id
    end
  end
end
