class UsersController < BaseController
  def index
    @users = User.where("name LIKE (?) ", "%#{params[:name]}%")
    render_json(@users)
  end
end