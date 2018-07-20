class AddTextToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :text, :text
  end
end
