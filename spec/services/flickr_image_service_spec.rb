require "rails_helper"

describe "flickr image service" do

  before :each do
    images = File.read('fixtures/denver_flicker_5_images.json')
    stub_request(:get, "https://api.flickr.com/services/rest?api_key=#{ENV['FLICKR_API_KEY']}&content_type=1&extras=url_o&format=json&method=flickr.photos.search&nojsoncallback=1&per_page=5&safe_search=0&tag_mode=all&tags=denver%2Cskyline%2Cpark").with( body: images)
    @info = FlickrImageService.get_photos('denver,co')
  end

  it ".get_image" do
    service = FlickrImageService.new
    expect(service).to be_a(FlickrImageService)
    expect(service.get_photos('denver,co')).to be_a(Array)
    expect(service.get_photos('denver,co')[0]).to match("https")
    expect(service.get_photos('denver,co')[4]).to match("https")
  end

end
