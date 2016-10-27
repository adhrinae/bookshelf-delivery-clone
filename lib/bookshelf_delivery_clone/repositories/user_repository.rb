class UserRepository
  include Hanami::Repository

  def self.find_by_username(username)
    query do
      where(username: username)
    end.first
  end

  def self.find_by_email(email)
    query do
      where(email: email)
    end.first
  end
end
