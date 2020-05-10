class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :verified_user
  helper_method :current_user

  private

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def neighbors
    if current_user
       User.where(zip_code: "#{current_user.zip_code}")
    else
      redirect_to '/'
    end
      
    #where(zip_code: '#{current_user.zip_code}').load
  end
end

def neighbor_swaps
  neighbors.map {|user| user.swaps}
end

#@neighbors.each do |t|
  #if t != current_user
  #    @neighbor=t
  #else
  #    @neighbor != t
  #end
#end