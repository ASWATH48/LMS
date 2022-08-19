class Answer < ApplicationRecord
  belongs_to :users_id
  belongs_to :quests_id
end
