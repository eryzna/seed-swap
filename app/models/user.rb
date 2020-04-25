class User < ActiveRecord::Base
    has_secure_password

    has_many :swaps
    has_many :seeds, :through => :swaps

end
