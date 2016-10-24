module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:name).filled(:str?)
        required(:username).filled(:str?)
        required(:password).filled(:str?).confirmation
      end
    end

    def call(params)
      halt 401 unless params.valid?

      name, username, password = params[:user].to_h.values_at(:name, :username, :password)
      result = User::Create.new(name, username, password).call
      @user = result.user

      flash[:success] = "User #{@user.name} Successfuly Created."

      redirect_to routes.home_path
    end
  end
end
