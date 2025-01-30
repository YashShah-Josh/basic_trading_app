class User < ApplicationRecord
    has_many :trades
  
    validates :name, presence: true
    validates :email, presence: true,
                     uniqueness: true,
                     format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true,
                     format: { with: /\A\d{10}\z/, message: "should be 10 digits" }
    validates :account_status, presence: true,
                             inclusion: { in: ['active', 'suspended', 'closed'] }
    validates :kyc_status, presence: true,
                          inclusion: { in: ['pending', 'approved', 'rejected'] }
    validates :account_balance, presence: true,
                              numericality: { greater_than_or_equal_to: 0 }
    validates :registration_date, presence: true
  
    before_validation :set_registration_date
  
    private
  
    def set_registration_date
      self.registration_date ||= Time.current
    end
  end