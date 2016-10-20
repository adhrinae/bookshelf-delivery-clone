class Activity
  include Hanami::Entity
  attributes :timestamp, :action, :old_title, :old_author, :new_title, :new_author
end
