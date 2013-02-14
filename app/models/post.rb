class Post
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  delegate :title, :to => @post_record

  def initialize(post_record)
    @post_record = post_record
  end

  def persisted?
    false
  end
end