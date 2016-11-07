module Web::Controllers::Users
  class Create
    include Web::Action
    include Web::Authentication::Skip

    expose :user

    params do
      required(:encrypted).schema do
        required(:name).filled(:str?)
        required(:username).filled(:str?)
        required(:email).filled(:str?)
        required(:password).filled(:str?).confirmation
      end
    end

    def call(params)
      byebug
      halt 401 unless params.valid?

      name, username, email, password = params[:encrypted].to_h.values_at(:name, :username, :email, :password)
      result = User::Create.new(name, username, email, password).call
      @user = result.user

      redirect_to routes.home_path
    end
  end
end
