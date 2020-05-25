class User < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, length: { in: 6..20}, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates :zip_code, length: { is: 5}
    has_secure_password

    has_many :swaps
    has_many :seeds, :through => :swaps

    def location
        location=ZipCodes.identify("#{self.zip_code}")
        @state=location[:state_name]
        @city=location[:city]
        "#{@city}, #{@state}"
     # => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta", :time_zone=>"America/New_York"}
    #  First run will take a while, as the yaml has to be loaded
    end

end
