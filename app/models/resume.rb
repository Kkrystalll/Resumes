class Resume < ApplicationRecord
  extend FriendlyId
  friendly_id :random_slug, use: :slugged

  # validation
  validates :title, presence: true
  validates :content, presence: true

  # relationship
  belongs_to :user

  has_one_attached :mugshot do |image|
    image.avatar.variant(resize_to_limit: [100, 100])
  end

  scope :draft, -> { where( status: "draft") }
  scope :published, -> { where(status: "published")}

  # def self.published
  #   where(status: "published")
  # end

  # def self.draft
  #   where(status: "draft")
  # end

  def self.all_status
    [
      ["草稿","draft"],
      ["發布","published"]
    ]
  end

  private
  def random_slug
    [*'0'..'9' , *'a'..'z'].sample(10).join
  end
end
