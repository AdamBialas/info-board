class Info < ApplicationRecord
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
    paginates_per 5
end
