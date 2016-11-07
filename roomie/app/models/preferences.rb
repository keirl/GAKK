class Preferences < ApplicationRecord
	validates :postal_code,:allow_blank => true, :numericality => {:only_integer => true, :greater_than => 0}, :length => { is: 5 }
	validates :street, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	validates :city, :format => {:with => /\A[a-zA-Z\d\-\s]+\z/, :message => "only allows letters, spaces, numbers and dashes"}, :if => :looking_for_residence
	belongs_to :user
end
