class Seller < ApplicationRecord
    has_many :trades
  
    validates :name, presence: true
    validates :email, presence: true,
                     uniqueness: true,
                     format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :target, presence: true,
                      numericality: { greater_than: 0 }
    validates :achieved, presence: true,
                        numericality: { greater_than_or_equal_to: 0 }
    validates :commission, presence: true,
                          numericality: { greater_than_or_equal_to: 0 }
    validates :status, presence: true,
                      inclusion: { in: ['active', 'inactive', 'on_leave'] }
  
    validate :achieved_cannot_exceed_target
  
    private
  
    def achieved_cannot_exceed_target
      if achieved.present? && target.present? && achieved > target
        errors.add(:achieved, "cannot exceed target")
      end
    end
  end