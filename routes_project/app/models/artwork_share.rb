# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord

    validates :viewer_id, :artwork_id, presence: true, uniqueness: true


    belongs_to :artwork,
    class_name: :Artwork,
    inverse_of: :artwork_shares

    belongs_to :viewer,
    class_name: :User,
    inverse_of: :artist

end
