class Blog < ApplicationRecord
	mount_uploader :image, AvatarUploader

	mount_uploader :video, VideoUploader  
	
	 has_many :comments, dependent: :destroy 
	 has_many :images
      validates :title, presence: true,
                    length: { minimum: 2 }

  accepts_nested_attributes_for :images

end
