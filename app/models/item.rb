class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
