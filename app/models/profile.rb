class Profile < ApplicationRecord
	validates :facebook_id, presence: true
end
