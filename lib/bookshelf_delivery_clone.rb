require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/bookshelf_delivery_clone/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/bookshelf_delivery_clone_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/bookshelf_delivery_clone_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/bookshelf_delivery_clone_development'
  #    adapter type: :sql, uri: 'mysql://localhost/bookshelf_delivery_clone_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping do
    collection :books do
      entity     Book
      repository BookRepository

      attribute :id,   Integer
      attribute :user_id,   Integer
      attribute :title, String
      attribute :author, String
    end

    collection :activities do
      entity      Activity
      repository  ActivityRepository

      attribute :id,          Integer
      attribute :timestamp,   Time
      attribute :action,      String
      attribute :old_title,   String
      attribute :old_author,  String
      attribute :new_title,   String
      attribute :new_author,  String
    end

    collection :users do
      entity User
      repository UserRepository

      attribute :id,                Integer
      attribute :name,              String
      attribute :username,          String
      attribute :email,             String
      attribute :password_digest,   String
      attribute :activation_digest, String
      attribute :activated,         TrueClass
      attribute :reset_digest,      String
      attribute :reset_sent_at,     DateTime
      attribute :created_at,        DateTime
      attribute :updated_at,        DateTime
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/bookshelf_delivery_clone/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
