require "rails_helper"

describe "BackgroundImageSerializer " do
  it "#present_images" do
    images = ["https://live.staticflickr.com/7820/40503807683_f09cb35286_o.jpg",
 "https://live.staticflickr.com/7852/40503751773_02c0bdb701_o.jpg",
 "https://live.staticflickr.com/7910/40433538333_0de60d81e5_o.jpg",
 "https://live.staticflickr.com/1944/45362346302_c2c1d3b576_o.jpg",
 "https://live.staticflickr.com/1961/44689496204_1bae8c8e75_o.jpg"]

    result = BackgroundImageSerializer.present_images(images)
    expect(result['data']['images']).to eq(images)
  end
end
