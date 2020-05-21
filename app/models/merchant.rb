class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices, dependent: :destroy
  has_many :items, dependent: :destroy

  def self.find_merchant(name)
    where(Merchant.arel_table[:name].matches("%#{name.downcase}")).first
  end
end
