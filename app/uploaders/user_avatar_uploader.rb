class UserAvatarUploader < AvatarUploader
  process :strip
  process :quality => 85 # Percentage from 0 - 100

  version :profile do
    process resize_to_fill: [500, 500]
  end

  version :side_bar do
    process resize_to_fill: [50, 50]
  end
end
