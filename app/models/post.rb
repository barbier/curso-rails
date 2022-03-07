class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { minimum: 100 }

  belongs_to :category
  belongs_to :account

  after_create :update_total_posts_count

  scope :active, -> { where(active: true) }
  scope :order_by_latest_first, -> { order(created_at: :desc) }
  scope :limit_5, -> { limit(5) }

  def details
    "Artigo publicado em #{created_at.strftime("%d/%M/%Y")}"
  end

  def self.total
    count
  end

  private

  def update_total_posts_count
    category.increment(:total_count, 1).save
  end
end
