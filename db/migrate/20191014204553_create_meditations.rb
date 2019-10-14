class CreateMeditations < ActiveRecord::Migration[6.0]
  def change
    create_table :meditations do |t|
      t.String :name

      t.timestamps
    end
  end
end
