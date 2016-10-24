Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column      :name,     String, null: false
      column      :username, String, null: false
      column      :password, String, null: false
    end
  end
end
