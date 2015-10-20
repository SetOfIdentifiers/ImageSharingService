class Comment < ActiveRecord::Base
	# Model that corresponds to the comment table from database
	attr_accessible :author, :target, :contents
    validates :contents, presence: true
end
