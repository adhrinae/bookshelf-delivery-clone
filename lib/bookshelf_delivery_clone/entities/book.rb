class Book
  include Hanami::Entity
  attributes :title, :author, :user_id

  def user
    @user ||= UserRepository.find(user_id)
  end
end
