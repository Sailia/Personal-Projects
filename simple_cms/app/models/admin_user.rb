class AdminUser < ActiveRecord::Base

	has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_USERNAMES = ['littlepoop', 'Ibi isn\'t a cat']

	# validates_presence_of(:first_name)
	# validates_length_of(:first_name, :maximum => 25)
	# validates_presence_of(:last_name)
	# validates_length_of(:last_name, :maximum => 50)
	# validates_presence_of(:username)
	# validates_length_of(:username, :within => 8..25)
	# validates_uniqueness_of(:username)
	# validates_presence_of(:email)
	# validates_length_of(:email, :maximum => 100)
	# validates_format_of(:email, :with => EMAIL_REGEX)
	# #And then last of all I've got validates confirmation of email, that's going to add a virtual attribute which doesn't have a column on my table. Its going to add a virtual attribute called email_confirmation and then if that value is there, It'll make sure that it matches the email, so if I'm ever on a form and say hey, I'd like them to re-enter this email address, then if it's there, it'll be checked. If it's not there, I take it off the form, it'll stop being checked, and it won't run this validation anymore.
	# validates_confirmation_of(:email)
#shortcut validations, aka "sexy validations"
	validates :first_name, :presence => true,
							:length => { :maximum => 25 }
	validates :last_name, :presence => true,
			     			:length => { :maximum => 50 }
	validates :username, :length => { :within => 8..25 },
			     			:uniqueness => true
	validates :email, :presence => true,
							:length => {:maximum => 100},
			     			:format => { :with => EMAIL_REGEX},
			      			:confirmation => true

	validate :username_is_allowed
	# validate :no_new_users_on_saturday, :on => :create

	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "has been restricted from use.")
		end
	end

	# def no_new_users_on_saturday
	# 	if Time.now.wday == 6
	# 		errors[:base] << "No new users on Saturdays."
	# 	end
	# end
end
