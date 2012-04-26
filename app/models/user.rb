class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

  before_create { generate_token :auth_token }

  def send_password_reset
    generate_token :password_reset_token
    self.password_reset_send_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end


  def generate_token column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


end

