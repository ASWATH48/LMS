# frozen_string_literal: true

class AddFkToLike < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :blog, foreign_key: true
  end
end
