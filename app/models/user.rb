class User < ActiveRecord::Base
    scope :neighbors, ->(zip_code) { where("zip_code == ?", zip_code) }

    scope :admin, ->{ where(admin: true)} 
    #validates :first_name, :last_name, :zip_code, :username, :email, presence: true
    has_secure_password
    has_many :swaps
    has_many :seeds, :through => :swaps

    def location
        location=ZipCodes.identify("#{self.zip_code}")
        @state=location[:state_name]
        @city=location[:city]
        "#{@city}, #{@state}"
    end
    
    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash["info"]["email"]
        if @user = User.find_by(:email => oauth_email)
            return @user
        else
            @user = User.create(:email => oauth.email, :password => SecureRandom.hex)
        end
    end

end
  