class Profile < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	validates :gender, presence: true
	validates :cleanliness_level, presence: true
	validates :outgoingness_level, presence: true
	validates :quietness_level, presence: true

	validate :is_a_smoker_presence
	validate :pet_friendly_presence

	validates_presence_of :street, :city, :state, :postal_code, :if => :has_residence_already

	
	def is_a_smoker_presence
		errors.add(:is_a_smoker, "can't be blank") if is_a_smoker.nil?
	end 

	def pet_friendly_presence
		errors.add(:pet_friendly, "can't be blank") if pet_friendly.nil?
	end 



	belongs_to :user
end
