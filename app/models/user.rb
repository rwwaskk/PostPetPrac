class User < ActiveRecord::Base
	
	# Include default devise modules. Others available are:
  	# :token_authenticatable, :confirmable,
  	# :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable

  	# Setup accessible (or protected) attributes for your model
  	attr_accessible :name,:email, :password, :password_confirmation, :remember_me,:photo,:micropost_id
	
	validates_presence_of :name #user must have a name
	validates_uniqueness_of :name, :email, :case_sensitive => false
	
	#paper clip
	has_attached_file :photo,
 	:styles => {
    	:thumb=> "100x100#",
    	:small  => "150x150>",
    	:medium => "300x300>",
    	:large =>   "400x400>" }

	#micropost & comments
	has_many :microposts,:dependent=>:destroy
	has_many :photos, :dependent=>:destroy
	has_many :microcomments,:dependent=>:destroy
	has_many :posts
	has_many :topics
	
	#albums, nested_attributes:photos
	has_many :albums,:dependent=>:destroy
	accepts_nested_attributes_for :albums, :allow_destroy => true

=begin
relationships:
  belongs_to :follower, :class_name=> "User"
  belongs_to :followed, :class_name=> "User"
=end  
	has_many :relationships, :foreign_key => 'follower_id',:dependent => :destroy
	has_many :followed_users, :through => :relationships, :source=> :followed
	has_many :reverse_relationships, :foreign_key=> "followed_id",
                                   :class_name=>  "Relationship",
                                   :dependent=>  :destroy
	has_many :followers, :through=> :reverse_relationships, :source=> :follower                                   
	
	
	#messages
 	 has_many :received_messages, :class_name => 'Message', :foreign_key => :recipient_id
 	 has_many :sent_messages,     :class_name=>'Message',   :foreign_key => :sender_id
 	 
 	 has_many :events
 	 
  	 
  	#notifications
  	 has_many :received_notifications, :class_name=>'Notification', :foreign_key=> :recipient_id
  	 
  	#likes
  	 has_many :likes, :foreign_key => 'user_id'
  	 has_many :liked_microposts, :class_name=>'Micropost', :through => :likes,:foreign_key => :micropost_id,
  	 		  :source => :user
  	 
  	 
  
  def getName
  return self.name
  end
  
  def feed
  Micropost.from_users_followed_by(self)
  end
  
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  

end
