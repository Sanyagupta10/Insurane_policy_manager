class Comment < ApplicationRecord
  belongs_to :policy
  belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
  validates :policy_id, presence: true
end
