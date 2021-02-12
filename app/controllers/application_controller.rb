class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
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
    end
  end

end
