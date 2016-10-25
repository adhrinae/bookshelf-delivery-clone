module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
      end
    end

    def current_user
      @current_user ||= UserRepository.find(session[:user_id])
    end
  end
end
