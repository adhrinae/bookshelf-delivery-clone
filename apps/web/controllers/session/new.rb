module Web::Controllers::Session
  class New
    include Web::Action

    params do
      required(:session).schema do
        required(:username).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.find_by_username(params[:session][:username])

      if @user
        log_in(@user)
        redirect_to routes.home_path
      else
        status 401, "Wrong username or password"
        redirect_to routes.users_path
      end
    end
  end
end
