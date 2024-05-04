class Theme < ApplicationRecord
    has_many :image, dependent: :destroy
end
