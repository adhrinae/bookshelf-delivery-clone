module Web
  module Authentication
    module Skip
      private

      def authenticate!
      end
    end

    def self.included(action)
      action.class_eval do
        before :authenticate!
        expose :current_user
      end
    end

    private

    def authenticate!
      redirect_to '/' unless authenticated?
    end

    def authenticated?
      !current_user.nil?
    end

    def current_user
      @current_user ||= UserRepository.find(session[:user_id])
    end
  end
end
