class AddFkToAssesment < ActiveRecord::Migration[6.1]
  def change
    add_reference :assesments, :user, foreign_key: true
  end
end
