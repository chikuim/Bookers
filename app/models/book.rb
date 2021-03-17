class Book < ApplicationRecord

  # バリデーションチェック
  validates :title, :body, presence: true

end
