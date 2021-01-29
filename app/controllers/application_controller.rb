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
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
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

#def neighbor_swaps(zip_code)
  #2.6.1 :032?>   neighbors = User.where(:zip_code => zip_code)
  #2.6.1 :033?>   return neighbors.map {|user| user.swaps}.flatten
  #2.6.1 :034?>   end

def neighbor_swaps
  neighbors.map {|neighbor| neighbor.swaps}.flatten
end

def neighbor_swaps(seed_id, zip_code)
  @seed = Seed.find_by_id(seed_id)
  @neighbor = User.where(:zip_code => zip_code)
  @neighbor_swaps = @neighbor.map {|neighbor| neighbor.swaps}.flatten
  @seed_swaps = @seed.swaps
  @seed_swap_ids = @seed_swaps.map {|swap| swap.id}
  @neighbor_swap_ids = @neighbor_swaps.map {|swap| swap.id}
  @neighbor_seed_swap = @seed_swap_ids & @neighbor_swap_ids 
  @final = []
  @neighbor_seed_swap.each do |t|
    @final << Swap.where(:id => t)
  end
  if final != []
    return @final
  else
    return "No swaps to show!"
  end
end

def require_login
  unless session.include? :user_id
    flash[:alert] = "You must be logged in to access that section."
    redirect_to '/'
    #return head(:forbidden) 
  end
end

def require_omniauth_login
  if session.include?(:email)
    redirect_to omniauth_new_path
  else
    flash[:alert] = "You must be logged in to access that section."
    redirect_to '/'
  end
end

#def neighbor_seed_swaps(seed)
  #@seed = Seed.find_by(seed.id)
  #@swaps = @seed.swaps
  #@seed_swaps = @swaps.

#def neighbor_seeds(zip_code)
  #2.6.1 :049?>   neighbors = User.where(:zip_code => zip_code)
  #2.6.1 :050?>   return neighbors.map {|neighbor| neighbor.seeds}.flatten
  #2.6.1 :051?>   end

#def neighbor_seed_swaps
  #neighbor_swaps.where()
  #def neighbor_seed_swaps
   # unless session[:city_id].nil? || session[:city_id].blank?
    #@city = City.find(session[:city_id])
    #@deal=@city.deals
    #@store=@deal.stores
 #end

 #@deals = @city.deals
#@stores = @deals.collect(&:stores)


  
