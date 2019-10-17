class AddCollectionIdToMeditations < ActiveRecord::Migration[6.0]
  def change
    add_column :meditations, :collection_id, :integer
  end
end
