module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    if ratings.size == 0
      return 0
    end
    ratings.map(&:score).inject(&:+)/ratings.count.to_f
  end
end