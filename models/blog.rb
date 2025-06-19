class Blog
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :date_posted, type: DateTime
  field :blog_slug, type: String
  field :content, type: String

  validates :slug, uniqueness: { message: "slug has already been taken" }
end
