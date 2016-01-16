class Api::BaseController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :json
	protected
	def current_user					# check if user is the logged in user
	@current_user ||= User.find_by(token: params[:token])
	@user ||= User.find_by(id: params[:user_id])
	if @user == @current_user
		@current_user
	end
	end
										# if not then this user is unauthorized
	 def authenticate_user!
 	unless current_user?
 	render status: :unauthorized
 	end
 end
 def current_user?
 	current_user.present?

 end
end
