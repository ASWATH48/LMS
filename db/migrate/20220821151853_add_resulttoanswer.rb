class AddResulttoanswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :result, :boolean
  end
end
