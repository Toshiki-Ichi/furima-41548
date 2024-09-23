class Customer < ApplicationRecord
	attr_accessor:token
has_one :area
belongs_to :item
belongs_to :user
end
