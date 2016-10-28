module Web::Controllers::Users
  class Activate
    include Web::Action
    include Web::Authentication::Skip

    def call(params)
      @user = UserRepository.find_by_email(params[:email])

      if @user && !@user.activated && @user.authenticated?('activation', params[:token])
        activate_user

        session[:user_id] = @user.id
        redirect_to routes.home_path
      else
        session[:user_id] = nil
        redirect_to routes.home_path
      end
    end

    private

    def activate_user
      @user.update(activated: true)
      UserRepository.update(@user)
    end
  end
end
