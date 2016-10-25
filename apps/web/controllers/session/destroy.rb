module Web::Controllers::Session
  class Destroy
    include Web::Action

    def call(params)
      log_out
      redirect_to routes.home_path
    end

    private

    def log_out
      session[:user_id] = nil
    end
  end
end
