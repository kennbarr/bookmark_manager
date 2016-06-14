class Tag
  include DataMapper::Resource

  property :id,     Serial
  property :name,   String

  has n, :links, through: Resource
end

def split_tag(tag)
  tag.split(',').each { |tag| tag.strip! }
end
