class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string		:title
    	t.text		:image
    	t.text		:text
    	t.integer		:user_id
      t.timestamps
    end
  end
end
