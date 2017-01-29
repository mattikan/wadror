class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  include RatingAverage

  def print_report
    puts name
    puts "established in #{year}"
    puts "number of beers: #{self.beers.count}"
  end

  def restart
    self.year = 2017
    puts "changed year to #{year}"
  end
end
