# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.string :blog_description

      t.timestamps
    end
  end
end
