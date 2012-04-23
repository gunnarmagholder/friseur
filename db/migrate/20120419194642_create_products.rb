class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :block_matrix, :limit => 8
      t.decimal :price

      t.timestamps
    end
  end
end
