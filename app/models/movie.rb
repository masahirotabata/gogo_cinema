class Movie < ApplicationRecord
   belongs_to :customer,optional: true
   has_many :real_estate_comments, dependent: :destroy
   attachment :image
end
