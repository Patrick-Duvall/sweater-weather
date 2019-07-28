class BackgroundImageSerializer

  def self.present_images(images)
    {
      'data' => {
        'images' => images
      }
    }
  end

end
