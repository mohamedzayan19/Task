class Api::PicturesController < Api::BaseController
 before_action :authenticate_user!,:only => [:create, :destroy]
 def index
 respond_with @pictures = User.find(params[:user_id]).pictures.all
 end


def show
	respond_with @picture = Picture.find(params[:id])
end


 def create
 	@user=User.find(params[:user_id])
 	@picture = @user.pictures.build(:image_url=> params[:image_url],:description => params[:description],:title => params[:title])
 	@picture.save
 end

def destroy
  @picture = Picture.find(params[:id])
  @picture.destroy
end




end
