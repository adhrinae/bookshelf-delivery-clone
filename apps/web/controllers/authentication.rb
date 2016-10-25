module Web
  module Authentication
    module Skip
      private

      def logged_in?
      end
    end

    def self.included(action)
      action.class_eval do
        before :logged_in?
        expose :current_user
      end
    end

    private

    def logged_in?
      redirect_to '/' if current_user.nil?
    end

    def current_user
      @current_user ||= UserRepository.find(session[:user_id])
    end
  end
end
