# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true

    has_one :user,
    primary_key: :id,
    class_name: :User
end
