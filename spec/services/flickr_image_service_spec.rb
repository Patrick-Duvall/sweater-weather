require "rails_helper"

describe "flickr image service" do
  it ".get_image" do
    service = FlickrImageService.new
    expect(service).to be_a(FlickrImageService)
    expect(service.get_photos(39.7392358, -104.990251, 2)).to be_a(Array)
    expect(service.get_photos(39.7392358, -104.990251, 1)[0]).to match("https")
  end

end
