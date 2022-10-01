class User < ApplicationRecord
      # adds virtual attributes for authentication
     has_secure_password
     # validates email
     validates :email, :presence => true
     validates :email,  :uniqueness => true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
     validates :password, :length => { :minimum => 2}
end
