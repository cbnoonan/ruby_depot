class PaymentType < ActiveRecord::Base
  has_many :order

  def self.names
    all.collect { |payment_type| payment_type.name }
  end
end
