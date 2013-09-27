class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :product
	validates :comment, :presence => true
	validates_uniqueness_of :user_id, :scope => [:product_id]
end
