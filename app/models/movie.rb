class Movie < ApplicationRecord
  belongs_to :category

  validates :title, :description,  presence: true
end
