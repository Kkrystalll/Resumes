class Resume < ApplicationRecord
  # validation
  validates :title, presence: true
  validates :content, presence: true

  # relationship
  belongs_to :user

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
end
