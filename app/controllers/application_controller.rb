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

  def neighbor_swaps
    @neighbors = User.neighbors("#{current_user.zip_code}")
    @neighbors.map {|neighbor| neighbor.swaps}.flatten
  end

  def neighbor_seed_swaps
    @seed = Seed.find(params[:seed_id])
    @seed_swaps = @seed.swaps
    @seed_swap_ids = @seed_swaps.map {|swap| swap.id}
    @neighbor_swap_ids = neighbor_swaps.map {|swap| swap.id}
    @seed_swap_ids & @neighbor_swap_ids 
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
end
