# frozen_string_literal: true

class Policytype < ApplicationRecord
  belongs_to :company
  has_many :policy, dependent: :destroy
  validates :name, presence: true
  validates :company_id, presence: true
  validates :duration, presence: true
  validates :premium_amt, presence: true, numericality: true
  validates :sum_insured, presence: true, numericality: true
end
