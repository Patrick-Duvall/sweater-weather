require "rails_helper"

describe "flickr image service" do

  before :each do
    images = File.read('fixtures/denver_flicker_5_images.json')
    stub_request(:get, "https://api.flickr.com/services/rest?api_key=#{ENV['FLICKR_API_KEY']}&content_type=1&extras=url_o&format=json&lat=39.7392358&lon=-104.990251&method=flickr.photos.search&nojsoncallback=1&per_page=5&radius=1&safe_search=0&tag_mode=all&tags=Denver%2Cskyline%2Cpark").to_return( body: images)
    @info = FlickrImageService.get_photos('denver,co')
  end

  it "#get_photos" do
    info = FlickrImageService.get_photos('denver,co')
    photos = info['photos']['photo']
    expect(photos.first['id']).to eq('43883070724')
    expect(photos.first['secret']).to eq('80ca0c6985')
    expect(photos.first['farm']).to eq(2)
    expect(photos.first['title']).to eq('Downtown Skyline from Civic Center, Denver, 2005')
    expect(photos.first['server']).to eq('1896')
    expect(photos.second['server']).to eq('65535')
    expect(photos.second['id']).to eq('35679602912')
    expect(photos.second['secret']).to eq('3015493383')
    expect(photos.second['farm']).to eq(66)
    expect(photos.second['title']).to eq('Civic Center Park - Denver, Colorado')
  end
end
