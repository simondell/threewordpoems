module PoetsHelper

  def gravatar_for poet, size: 80
    id = Digest::MD5::hexdigest poet.email.downcase
    url = "https://secure.gravatar.com/avatar/#{id}?s=#{size}"
    image_tag url, alt: ''
  end
end
