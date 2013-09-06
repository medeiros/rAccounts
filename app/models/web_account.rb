class WebAccount
  include Mongoid::Document

  field :name
  field :url
  field :login
  field :password
  field :description

  validates :name, presence: true, length: { minimum: 3 }

end

