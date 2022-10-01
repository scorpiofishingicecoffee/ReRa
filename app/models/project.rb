class Project < ApplicationRecord
  has_many :tasks
validates :title, :description, :presence => true
validates :title, :length => { :minimum => 2}
validates :title, :uniqueness => true
validates :description, :length => { :minimum => 2}
validates :description, :uniqueness => true
end
