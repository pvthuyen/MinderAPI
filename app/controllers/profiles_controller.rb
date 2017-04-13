class ProfilesController < ApplicationController
	skip_before_action :verify_authenticity_token
	helper GeometryHelper
	def create
        profile = Profile.find_or_create_by(params.permit(:facebook_id, :name, :DOB, :gender))
		render json: profile
	end

    def edit_travel_info
        profile = Profile.find(params[:profile_id])
        profile.update_attributes bike: params[:bike], origin_lat: params[:origin_lat], origin_lng: params[:origin_lng], destination_lat: params[:destination_lat], destination_lng: params[:destination_lng]
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
		distance = helpers.distance([profile.origin_lat, profile.origin_lng], [other_profile.origin_lat, other_profile.origin_lng])
		puts distance
		if other_profile.id == 2
			return true
		end
		return false
	end
end
