class Article < ApplicationRecord
    belongs_to :user, :optional => true
    delegate   :username, to: :user, prefix: true

    has_many   :comments, dependent: :destroy
    validates  :title, presence: true, length: { minimum: 5 }
    validates  :context, length: { maximum: 255 }
end
