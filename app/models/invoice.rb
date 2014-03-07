class Invoice < ActiveRecord::Base
	belongs_to :user

	validates :name, :presence => true, length: { minimum: 1, maximum: 65 }
	validates :company, length: { minimum: 1, maximum: 65 }

	validates :hours, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 999.99 }

	validates :hourly_rate, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 999.99 }

	validates :user_id, presence: true

end
