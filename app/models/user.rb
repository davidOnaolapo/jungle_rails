class User < ActiveRecord::Base
  has_secure_password
  validates :password, :length => {:minimum => 7 }

  def self.authenticate_with_credentials(email, password)
    processed_email = email.strip.downcase
    puts "PROCESSED EMAIL+++", processed_email
    user = User.find_by_email(processed_email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    end
    return nil
  end
end
