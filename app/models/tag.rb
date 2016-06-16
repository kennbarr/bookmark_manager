class Tag
	include DataMapper::Resource

	has n, :links, through: Resource

	property :id, Serial
	property :name, String

end

def split_tag(tag)
	tag.split(',').each { |tag| tag.strip! }
end
