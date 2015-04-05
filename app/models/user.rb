class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password
  belongs_to :class_student

  with_options dependent: :destroy do |assoc|
    assoc.has_many :scores
    assoc.has_many :fees
    assoc.has_many :table_scores
    assoc.has_many :total_scores
    assoc.has_many :activities
    assoc.has_one :discipline
  end
  validates :password, length: {minimum: 6}, allow_blank: true
  validates :username, presence: true
  
  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # def is_admin
  #   self.admin?
  # end
  scope :all_except, ->(user) {where.not(id: user)}
end
