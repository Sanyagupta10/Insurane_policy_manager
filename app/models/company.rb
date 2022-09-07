class Company < ApplicationRecord
	has_many :policytype,:dependent => :destroy
	has_many :policy,    :dependent => :destroy 
	validates :name, presence: true
	validates :description, presence: true
end
