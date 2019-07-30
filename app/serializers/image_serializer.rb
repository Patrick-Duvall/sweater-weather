class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :alt, :address, :id
end
