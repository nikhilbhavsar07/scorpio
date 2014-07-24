class AddAttachmentsPhotoToArticles < ActiveRecord::Migration


  def self.up
    add_attachment :articles, :avatar
  end

  def self.down
    remove_attachment :articles, :avatar
  end

end
