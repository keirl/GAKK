class Preferences < ApplicationRecord
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	validates :street, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	validates :city, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	

	validates :gender, presence: true
	validates :cleanliness_level, presence: true
	validates :outgoingness_level, presence: true
	validates :quietness_level, presence: true

	validate :smoker_presence
	validate :pet_friendly_presence

	validates_presence_of :street, :city, :state, :postal_code, :if => :looking_for_residence

	
	def smoker_presence
		errors.add(:smoker, "can't be blank") if smoker.nil?
	end 

	def pet_friendly_presence
		errors.add(:pet_friendly, "can't be blank") if pet_friendly.nil?
	end 



	belongs_to :user
end


