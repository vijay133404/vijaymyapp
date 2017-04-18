class Blog < ApplicationRecord
	mount_uploader :image, AvatarUploader

	mount_uploader :video, VideoUploader  
	 has_many :comments, dependent: :destroy 
	 
  validates :title, presence: true,
                    length: { minimum: 2 }

end
