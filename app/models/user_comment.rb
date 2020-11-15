class UserComment < ApplicationRecord
    belongs_to :hotel
    belongs_to :user
end
