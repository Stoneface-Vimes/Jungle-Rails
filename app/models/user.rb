class User < ActiveRecord::Base
  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, confirmation: true, uniqueness: true, length: {minimum: 3}
  validates :email_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
