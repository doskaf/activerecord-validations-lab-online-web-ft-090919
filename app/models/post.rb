class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?

    def is_clickbait?
        keywords = [/Secret/, /Won't Believe/, /Secret/, /Top [\d]/, /Guess/]
        if keywords.none? { |word| word.match title }
            self.errors[:title] << "Your title isn't clickbait-y enough!"
        end  
    end

end
