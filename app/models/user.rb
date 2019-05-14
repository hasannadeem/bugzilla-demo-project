class User < ApplicationRecord

  has_many :bugs, foreign_key: 'creator_id'
  has_many :project_users
  has_many :projects, through: :project_users
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def manager?
    user_type == 'manager'
  end

  def qa?
    user_type == 'qa'
  end
  
  def developer?
    user_type == 'developer'
  end
  
end
