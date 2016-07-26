module PoetsHelper

  def gravatar_for poet, options = { size: 50 }
    id = Digest::MD5::hexdigest poet.email.downcase
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{id}?s=#{size}"
    image_tag url, alt: ''
  end
end
