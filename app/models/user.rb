class User < ActiveRecord::Base
  validates :name, :alias, :password, presence:true 
  validates :email, uniqueness: true 
  before_save :downcase_fields
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  
  def downcase_fields
    self.email.downcase!
  end 

  has_many :likes

  has_many :ideas
  has_many :ideas_liked, through: :likes, source: :ideas
  has_secure_password
end