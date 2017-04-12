class ProfilesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		profile = Profile.find_or_create_by(params.permit(:facebook_id, :origin_lat, :origin_lng, :destination_lat, :destination_lng))
		render json: profile
	end

	def matches
		profiles = Profile.all
		returned_profiles = []
		profiles.each { |profile| returned_profiles.push(profile) if is_matched(profile) }
		render json: returned_profiles
	end

	def is_matched(other_profile)
		profile = Profile.find(params[:profile_id])
		if other_profile.id == 2
			return true
		end
		return false
	end
end
