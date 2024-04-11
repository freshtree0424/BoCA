class Admin::HomesController < AdminController
  def top
  end
  
  def search
    case params[:search_model]
    when "user" then
      redirect_to admin_users_path(search: params[:search])
    when "post" then
      redirect_to admin_posts_path(search: params[:search])
    end
  end
end
