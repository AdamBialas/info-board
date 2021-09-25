class Info < ApplicationRecord

belongs_to :user, optional: true
    paginates_per 5
end
