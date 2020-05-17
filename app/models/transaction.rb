class Transaction < ApplicationRecord
  validates :result, presence: true
  validates :credit_card_number, presence: true
  enum result: %w[success failed]

  belongs_to :invoice
end