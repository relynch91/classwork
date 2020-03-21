# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  artist_id  :integer          not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
     #validates :username, presence: true, uniqueness: true
     validates :title, uniqueness: { scope: :artist_id} 

     belongs_to :artist,
          dependent: :destroy,
          foreign_key: :artist_id,
          class_name: :User
     
     has_many :shares,
          foreign_key: :artwork_id,
          class_name: :ArtworkShare

     has_many :shared_viewers,
          through: :shares,
          source: :artwork
     
end
