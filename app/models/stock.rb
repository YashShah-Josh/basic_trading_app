class Stock < ApplicationRecord
    has_many :trades
    has_many :market_trends
  
    validates :symbol, presence: true, 
                      uniqueness: true,
                      format: { with: /\A[A-Z]+\z/, message: "only allows capital letters" }
    validates :name, presence: true
    validates :current_price, presence: true,
                            numericality: { greater_than_or_equal_to: 0 }
    validates :previous_close, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :day_high, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :day_low, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :change_percentage, numericality: true, allow_nil: true
    validates :status, presence: true,
                      inclusion: { in: ['active', 'suspended', 'delisted'] }
    
    validate :day_high_greater_than_low
  
    private
  
    def day_high_greater_than_low
      if day_high.present? && day_low.present? && day_high < day_low
        errors.add(:day_high, "must be greater than day low")
      end
    end
  end