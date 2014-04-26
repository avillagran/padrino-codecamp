migration 1, :create_users do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :id, DataMapper::Property::Serial
      column :name, DataMapper::Property::String, :length => 255
      column :age, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :users
  end
end
