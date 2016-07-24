class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	has_attached_file :image, styles: { :medium => "700x500#", :small => "350x250>" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/,
	    :default_url => "/images/:style/missing.png",
	    :url  => ":s3_domain_url",
	    :path => "public/system/posts/images:id/:style_:basename.:extension",
	    :storage => :fog,
	    :fog_credentials => {
	        provider: 'AWS',
        	aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        	aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
	    },
    	fog_directory: ENV["FOG_DIRECTORY"]

end


