class Info::Comment < ActiveRecord::Base    
    belongs_to :commentable, polymorphic: true
    belongs_to :User
end
