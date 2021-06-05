class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_fill: [300, 300, "Center"]

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  
  version :thumb100 do
    process resize_to_fit: [100, 100]
  end

  version :thumb150 do
    process resize_to_fit: [150, 150]
  end

  version :thumb200 do
    process resize_to_fit: [200, 200]
  end

  version :thumb250 do
    process resize_to_fit: [250, 250]
  end

  version :thumb300 do
    process resize_to_fit: [300, 300]
  end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  # storage :fog
  # storage :file

  def default_url(*args)
    "default.png"
  end

  # アップロードファイルの保存先
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
    # process resize_to_fill: [200, 200, "Center"]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  def size_range
    0..5.megabytes
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
