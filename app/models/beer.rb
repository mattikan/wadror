class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true

  include RatingAverage

  def to_s
    String asdf = self.name + ' by ' + self.brewery.name
  end

end
