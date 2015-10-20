class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates :name, presence: true
  validates :password, presence: true
  
  def self.login(name, password)
    return User.where("name = ? AND password = ?", name, password).first	
  end
  
  def self.register(name, password)
    result = false
    user = User.new()
	user.name = name
	user.password = password
    
    if(result = user.creatable)
        user.save
    end
    
    return result
  end
    
  def creatable
    return isUnique && self.valid?
  end
   
  
  def isUnique
    return User.where("name = ?", self.name).empty?
  end
  
  def getName
	return self.name
  end
end