class Post
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  ATTRIBUTES = [:id, :title, :body]
  attr_accessor *ATTRIBUTES

  def initialize(attributes={})
    self.attributes = attributes
  end

  def attributes=(new_attributes)
    attributes = ActiveSupport::HashWithIndifferentAccess.new(new_attributes)
    ATTRIBUTES.each do |key|
      send("#{key}=", attributes[key]) if attributes.include? key
    end
  end

  def persisted?
    id.present?
  end

  def to_s
    attribute_map = Hash[ATTRIBUTES.map { |key| [key, send(key.to_sym)] }]
    "#<#{self.class} #{attribute_map.map{|k,v| "#{k}: #{v.inspect}"}.join(', ')}>"
  end
end
