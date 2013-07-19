class AddPostsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :post_a, :text
    add_column :works, :post_b, :text
    add_column :works, :post_c, :text
    add_column :works, :post_d, :text
  end
end
