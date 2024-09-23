class Customer < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	attr_accessor:token
has_one :area
belongs_to :item
belongs_to :user
belongs_to :region
end
