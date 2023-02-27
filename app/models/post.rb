class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "is not included in the list"}
    validate :title_is_clickbait

    def title_is_clickbait
        if title.present? && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
            errors.add(:title, "must be sufficiently clickbait-y")
        end
    end
end
