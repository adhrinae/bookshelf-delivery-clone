module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
      end
    end

    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= UserRepository.find(session[:user_id])
    end

    def logged_in?
      !current_user.nil?
    end
  end
end
