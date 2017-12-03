class Movie < ApplicationRecord
  belongs_to :category

  validates :title, :description,  presence: true

  has_attached_file :movie_image, styles: { movie_index: "200x550>", movie_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :movie_image, content_type: /\Aimage\/.*\z/
end
