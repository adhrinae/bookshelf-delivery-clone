module Web::Controllers::Session
  class New
    include Web::Action
    include Web::Authentication::Skip

    params do
      required(:session).schema do
        required(:username).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @user = UserRepository.find_by_username(params[:session][:username])

      if @user && @user.authenticate(params[:session][:password])
        log_in(@user)
        redirect_to routes.home_path
      else
        redirect_to routes.home_path
      end
    end

    private

    def log_in(user)
      session[:user_id] = user.id
    end
  end
end
