class Template
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :desc, type: String
end
