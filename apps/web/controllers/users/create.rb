module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:name).filled(:str?)
        required(:username).filled(:str?)
        required(:email).filled(:str?)
        required(:password).filled(:str?).confirmation
      end
    end

    def call(params)
      halt 401 unless params.valid?

      name, username, email, password = params[:user].to_h.values_at(:name, :username, :email, :password)
      result = User::Create.new(name, username, email, password).call
      @user = result.user

      redirect_to routes.home_path
    end
  end
end
