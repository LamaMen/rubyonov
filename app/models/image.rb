class Image < ApplicationRecord
    belongs_to :theme
    has_many :value, dependent: :destroy
end
