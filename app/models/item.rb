class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :string, presence: true

  validates :category_id, numericality: { other_than: 1 } 

end
