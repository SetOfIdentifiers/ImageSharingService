class Image < ActiveRecord::Base

  RANDOM_METHOD = "RANDOM()"
  NOT_APPLICABLE_RATING = "N/A"

  attr_accessible :uploader, :name, :data, :content_type, :total_rating, :number_of_raters
  
  def self.random()
     return Image.first(:order => RANDOM_METHOD)
  end
  
  def self.create(user_id, file)
  
    image = Image.new()
    result = false
  
    image.name = file.original_filename
	image.uploader = user_id
	image.data = file.read
	image.total_rating = 0
	image.number_of_raters = 0
	image.content_type = file.content_type
    
    if(result = image.valid?)
        image.save
    end
        
    return result
  
  end
  
  def rate(rating)
	self.number_of_raters = self.number_of_raters + 1
	self.total_rating = self.total_rating + rating.to_i
	self.save
  end
  

  
  def reply(user, contents)
  
    # POST action for comment
  
    comment = Comment.new()
  
    comment.author = user
    comment.target = self.id
    comment.contents = contents
	
    comment.save
  
  end
  
  def getAllComments
    # Invokes an activerecord query that returns all the comments associated with this image, based on the foreign key 'target' of the comment
	comments = Comment.where("target = ?", self.id).all	
  end
  
    def rating
  
	# Recalculates the rating of this image
  
    ratings = NOT_APPLICABLE_RATING
  
	if(number_of_raters > 0)
		ratings = total_rating.to_f / number_of_raters.to_f
	end
		
	return ratings
  
  end
end
