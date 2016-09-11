module UsersHelper

  #returns the gravar for the given user
  def gravatar_for(user)
    gravatar_url = "https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(user.email)}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
