class Image
  attr_reader :alt, :address, :id
  def initialize(info)
    @alt = info['title']
    @address = "https://farm#{info['farm']}.staticflickr.com/#{info['server']}/#{info['id']}_#{info['secret']}.jpg"
    @id = info['id'].to_i
  end
end
