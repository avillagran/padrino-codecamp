class User
  include DataMapper::Resource
  # No incluye timestamps por defecto
  include DataMapper::Timestamp 

  
  property :id,     Serial
  property :name,   String
  property :age,    Integer
  
  # Utilizaremos created_at y updated_at
  timestamps :at

end
