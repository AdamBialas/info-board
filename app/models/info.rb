class Info < ActiveRecord::Base
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all, as: :commentable

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

settings analysis: {        
            analyzer: {
              partial_analyzer: {
                type: "snowball",
                tokenizer: "standard",
                filter: ["standard", "lowercase"]
              }
            }
          }  do mappings dynamic: false do 
          indexes :contents, type: :text, analyzer: "partial_analyzer"
        end
    end
  belongs_to :user, optional: true


def like_by_user(user)    
  dd = self.likes.where("user_id= ?",user.id).first
  return dd
end

def like_count
  dd = self.likes.select("count() as like_count").first
  p dd.like_count
  return dd
end

end