class UsersController < BaseController
  def index
    @users = params[:name] ? User.where("name LIKE (?) ", "%#{params[:name]}%") : User.none
    render_json(@users)
  end
end