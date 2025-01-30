class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :quantity, presence: true,
                      numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true,
                   numericality: { greater_than: 0 }
  validates :trade_type, presence: true,
                        inclusion: { in: ['buy', 'sell'] }
  validates :status, presence: true,
                    inclusion: { in: ['pending', 'completed', 'cancelled', 'failed'] }
  validates :transaction_date, presence: true

  before_validation :set_transaction_date
  validate :user_has_sufficient_balance, if: :is_buy_trade?

  private

  def set_transaction_date
    self.transaction_date ||= Time.current
  end

  def is_buy_trade?
    trade_type == 'buy'
  end

  def user_has_sufficient_balance
    if is_buy_trade? && user.present?
      total_cost = quantity * price
      if user.account_balance < total_cost
        errors.add(:base, "Insufficient account balance")
      end
    end
  end
end
