class Api::UsersController < Api::BaseController
	def create
		@user = User.new(:email=> params[:email],:password => params[:password], :name => params[:name])
		if @user.save

		else
			render json: {}, status: 401
		end
	end
	def show
		respond_with @user = User.find(params[:id])
	end
	def index
		respond_with @users = User.all
	end
end