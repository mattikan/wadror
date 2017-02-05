class User < ActiveRecord::Base
  has_many :ratings
  has_many :beers, through: :ratings

  has_secure_password

  validates :username,
            uniqueness: true,
            length: { minimum: 3, maximum: 30}

  validates :password,
            presence: true,
            length: { minimum: 4 },
            format: { with: /\A(.*[A-Z].*\d.*|.*\d.*[A-Z].*)\z/}

  include RatingAverage
end
