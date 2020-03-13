class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true

  def self.random_code
    found = false
    until found 
      random_combo = SecureRandom.urlsafe_base64
      if !ShortenedUrl.exists?(:short_url => random_combo)
        return random_combo
      end
    end
  end

  # def create!
    
  # end
end
