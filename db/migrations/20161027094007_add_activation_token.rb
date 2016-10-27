Hanami::Model.migration do
  change do
    add_column :users, :activation_token, String
  end
end
