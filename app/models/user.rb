class User < ActiveRecord::Base
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
