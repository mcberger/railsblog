class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	scope :signed_up_recently, -> (days_ago = 2) {
		where 'created_at between ? and ?', Time.now - days_ago.day, Time.now
	}

	scope :signed_up_today, -> {
		where 'created_at between ? and ?', Time.now.beginning_of_day, Time.now.end_of_day
	}


end
