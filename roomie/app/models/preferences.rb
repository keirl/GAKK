class Preferences < ApplicationRecord
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	belongs_to :user
end
