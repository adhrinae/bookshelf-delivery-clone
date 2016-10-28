module Web::Controllers::PasswordResets
  class Create
    include Web::Action
    include Web::Authentication::Skip

    def call(params)
      @user = UserRepository.find_by_email(params[:password_reset][:email])
      if @user
        @user.create_reset_digest
        Mailers::PasswordReset.deliver(user: @user)
        redirect_to routes.home_path
      else
        flash[:negative] = "Email address not found"
        redirect_to routes.home_path
      end
    end
  end
end
