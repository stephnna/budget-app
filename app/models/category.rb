class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, :icon, presence: true, length: { maximum: 255 }

  def recent_payments
    payments.order(created_at: :desc)
  end

  def total_payment
    payments.sum(:amount)
  end
end
