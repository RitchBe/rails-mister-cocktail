class Image < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :model
  has_mongoid_attached_file :file,
   :path => ":rails_root/public/uploads/:class/:id/:basename.:extension"

  delegate :url, :path, to: :file, allow_nil: true, prefix: false
end
