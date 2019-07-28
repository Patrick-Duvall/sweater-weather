require "rails_helper"

describe "flickr image service" do
  it ".get_image" do
    service = FlickrImageService.new
    expect(service).to be_a(FlickrImageService)
    expect(service.get_photos("denver,co", 1)).to be_a(Array)
    expect(service.get_photos("denver,co", 1)[0]).to match("https")
  end

end
