class AddSvgToWorks < ActiveRecord::Migration
  def change
    add_column :works, :svg, :text
  end
end
