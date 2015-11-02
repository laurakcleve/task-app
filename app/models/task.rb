class Task < ActiveRecord::Base
	has_many :taggings
  has_many :tags, through: :taggings

  def complete?
		return completed == true
	end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

  # For populating new tag list for task
  def unused_tags
    unusedTags = []
    Tag.all.each do |tag|
      unless tag_list.include?(tag.name)
        unusedTags.push tag
      end
    end
    return unusedTags
  end
end
