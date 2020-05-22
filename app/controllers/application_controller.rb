class ApplicationController < ActionController::Base
	before_action :current_cart
	before_action :site_search

	def current_cart
		@current_cart ||= ShoppingCart.new(token: cart_token)
	end
	helper_method :current_cart

	private

	def cart_token
		return @cart_token unless @cart_token.nil?

		session[:cart_token] ||= SecureRandom.hex{8}
		@cart_token = session[:cart_token]
	end

	def site_search
		@q = Category.ransack(params[:q])
		@search_categories = @q.result
	end
end
