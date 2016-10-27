Hanami::Model.migration do
  change do
    rename_column :users, :password, :password_digest
    add_column :users, :activation_digest, String
    add_column :users, :activated, TrueClass
    add_column :users, :reset_digest, String
    add_column :users, :reset_sent_at, DateTime

    add_column :users, :created_at, DateTime
    add_column :users, :updated_at, DateTime
  end
end
