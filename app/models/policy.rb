# frozen_string_literal: true

class Policy < ApplicationRecord
  belongs_to :user
  belongs_to :policytype
  belongs_to :company

  has_many_attached :documents
  has_many :comments, dependent: :destroy

  validates :policy_type, presence: true
  validates :sum_insured, presence: true
  validates :premium_amt, presence: true
  validates :commission, presence: true
  validates :purchase_date, presence: true
  validates :mature_date, presence: true
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :policytype_id, presence: true
end
