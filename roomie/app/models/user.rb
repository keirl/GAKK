class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :preferences

  def create_matches(user)
  	if user.preferences != nil
  		matches = Hash.new
  		Profile.all.each do |prof|
  		#	debugger
	  		if prof != nil
          debugger
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

  	scores_sum = cleanliness_level_score + outgoingness_level_score + quietness_level_score
  	highest_potential_positive_sum = 30 # add 10 for each attribute
  	highest_potential_negative_sum = 30 # add 10 for each attribute
  	score_sum_adjusted = scores_sum + highest_potential_negative_sum # zero the highest potential negative
  	percent_match = 100 * score_sum_adjusted / (highest_potential_negative_sum + highest_potential_positive_sum)
  	return percent_match
  end

  def get_attribute_weight(q)
  	q = q.abs
  	if q == 0
  		return 10
  	elsif q == 1
  		return 5
  	elsif q == 2
  		return 0
  	elsif q == 3
  		return -5
  	else
  		return -10
  	end
  end
end
