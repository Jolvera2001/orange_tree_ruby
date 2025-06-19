class Blog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :blog_slug, type: String
  field :content, type: String

  validates :slug, uniqueness: { message: "slug has already been taken" }
end
