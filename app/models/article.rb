class Article < ApplicationRecord
    belongs_to :user
    delegate   :username, to: :user, prefix: true

    has_many   :comments, dependent: :destroy
    validates  :title, presence: true, length: { minimum: 5 }
end
