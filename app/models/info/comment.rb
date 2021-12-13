class Info::Comment < ActiveRecord::Base
    has_rich_text :text_
    belongs_to :commentable, polymorphic: true
    belongs_to :User
end
