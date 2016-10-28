module Web::Controllers::PasswordResets
  class Update
    include Web::Action
    include Web::Authentication::Skip

    params do
      required(:user).schema do
        required(:email).filled
        required(:password).filled(:str?).confirmation
      end
    end

    def call(params)
      @user = UserRepository.find_by_email(params[:user][:email])
      @user.password_digest = digest(params[:user][:password])

      UserRepository.update(@user)

      redirect_to routes.home_path
    end

    private

    def digest(string)
      BCrypt::Password.create(string)
    end
  end
end
