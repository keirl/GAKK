class Profile < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true}
	belongs_to :user
end
