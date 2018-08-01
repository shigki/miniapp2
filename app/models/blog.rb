class Blog < ActiveRecord::Base
	belongs_to :user
	validates :title, :text, :image, presence: true
	validate :add_error_sample

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if title.empty?
      errors.add(:title, "を入力してください")
    end
    if image.empty?
      errors.add(:image, "を入力してください")
    end
    if text.empty?
      errors.add(:text, "を入力してください")
    end
  end
end
