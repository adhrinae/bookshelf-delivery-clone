Hanami::Model.migration do
  change do
    drop_table :books

    create_table :books do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column      :title,  String, null: false
      column      :author, String, null: false
    end
  end
end
