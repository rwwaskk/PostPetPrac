class User < ActiveRecord::Base
has_attached_file :photo,
 :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "400x400>" }

validates_presence_of :name
has_many :microposts
has_many :microcomments
has_many :relationships, :foreign_key => 'follower_id',:dependent => :destroy
has_many :followed_users, :through => :relationships, :source=> :followed
has_many :reverse_relationships, :foreign_key=> "followed_id",
                                   :class_name=>  "Relationship",
                                   :dependent=>  :destroy
has_many :followers, :through=> :reverse_relationships, :source=> :follower                                   
validates_uniqueness_of :name, :email, :case_sensitive => false
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,:email, :password, :password_confirmation, :remember_me,:photo
  # attr_accessible :title, :body
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
