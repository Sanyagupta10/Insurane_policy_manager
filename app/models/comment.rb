class Comment < ApplicationRecord
  belongs_to :policy
  belongs_to :user
  validates :body, presence: true
end
