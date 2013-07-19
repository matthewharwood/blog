class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name, :null => false
      t.text :subtitle

      t.timestamps
    end
  end
end
