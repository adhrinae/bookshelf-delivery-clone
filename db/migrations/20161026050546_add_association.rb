Hanami::Model.migration do
  change do
    add_column :books, :user_id, Integer, unique: true
  end
end
