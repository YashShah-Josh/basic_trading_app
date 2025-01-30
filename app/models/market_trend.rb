lass MarketTrend < ApplicationRecord
  belongs_to :stock

  validates :opening_price, presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
  validates :closing_price, presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
  validates :volume, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :trend_date, presence: true
  validates :trend_type, presence: true,
                        inclusion: { in: ['bullish', 'bearish', 'neutral'] }

  validate :trend_date_cannot_be_in_future

  private

  def trend_date_cannot_be_in_future
    if trend_date.present? && trend_date > Date.current
      errors.add(:trend_date, "cannot be in the future")
    end
  end
end