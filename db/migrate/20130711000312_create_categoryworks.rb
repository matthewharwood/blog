class CreateCategoryworks < ActiveRecord::Migration
  def change
    create_table :categoryworks do |t|
      t.integer :category_id, :null => false
      t.integer :work_id, :null => false

      t.timestamps
    end
  end
end
