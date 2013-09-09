class PostRepository
  def self.all
    PostRecord.all.map { |post_record| Post.new(post_record.attributes) }
  end

  def self.find id
    Post.new(PostRecord.find(id).attributes)
  end

  def self.save(post)
    post_record = if post.id.present?
      PostRecord.find(post.id)
    else
      PostRecord.new
    end

    attributes             = PostRecord.accessible_attributes.to_a.select { |x| x.present? }
    post_record.attributes = Hash[attributes.map do |key|
      [key, post.send(key.to_sym)]
    end]

    post_record.save
  end

  def self.destroy(post)
    PostRecord.find(post.id).destroy
  end
end
