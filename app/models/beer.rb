class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  include RatingAverage

  def to_s
    String asdf = self.name + ' by ' + self.brewery.name
  end

end
