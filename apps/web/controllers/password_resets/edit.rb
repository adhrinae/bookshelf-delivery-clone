module Web::Controllers::PasswordResets
  class Edit
    include Web::Action
    include Web::Authentication::Skip

    expose :user

    def call(params)
      @user = UserRepository.find_by_email(params[:email])

      unless @user && @user.activated && @user.authenticated?('reset', params[:id])
        redirect_to routes.home_path
      end
    end
  end
end
