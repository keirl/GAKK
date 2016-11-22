class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :preferences

  def create_matches(user)
  	if user.preferences != nil
      Match.where(user_id_1: user.id).destroy
  		matches = Hash.new
  		Profile.all.each do |prof|
  		#	debugger
	  		if prof != nil
     #     debugger
	  			if user.preferences.gender != prof.gender || user.preferences.smoker != prof.is_a_smoker || user.preferences.user_id == prof.user_id
	  				next
	  			end
	  			percent_match = get_percent_match(user.preferences, prof)
	  			if percent_match < 50
	  				next
	  			end
	  			matches[prof.user_id] = percent_match
	   		end
	   	end
	   	if matches.empty?
	   		no_matches_alert =	"No matches were found yet. Sorry! Your preferences are just too Xtreme!"\
	   							" Either adjust your preferences or tell your other Xtreme friends to sign up!."\
	   							" More people more matches!"
	   	else
	   		matches.sort_by { |id, percent| percent }
	   		matches.each do |id, percent|
          Match.create(user.id, id, percent)
        end
	   	end
	  else
		  preferences_not_created_alert =	"Please fill out your preferences."
    end
  end

  def get_percent_match(pref, prof)
  	cleanliness_level_score = get_attribute_weight((pref.cleanliness_level - prof.cleanliness_level))
  	outgoingness_level_score = get_attribute_weight((pref.outgoingness_level - prof.outgoingness_level))
  	quietness_level_score = get_attribute_weight((pref.quietness_level - prof.quietness_level))
    current_number_of_attributes = 3
    highest_potential_positive_sum = 100
  	scores_sum = cleanliness_level_score + outgoingness_level_score + quietness_level_score
  	percent_match = 100 * scores_sum / (current_number_of_attributes * highest_potential_positive_sum)
  	return percent_match
  end

  def get_attribute_weight(q)
  	q = q.abs
  	if q == 0
  		return 100
  	elsif q == 1
  		return 75
  	elsif q == 2
  		return 50
  	elsif q == 3
  		return 25
  	else
  		return 0
  	end
  end
end
