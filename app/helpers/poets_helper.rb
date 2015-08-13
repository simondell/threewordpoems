module PoetsHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(poet)
    gravatar_id = Digest::MD5::hexdigest(poet.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: poet.name, class: "gravatar")
  end

end
