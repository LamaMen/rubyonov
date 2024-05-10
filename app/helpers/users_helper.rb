module UsersHelper
    def gravatar_for(user, size = 120)
        hash =Digest::MD5::hexdigest(user.email.downcase)
         
        default = "wavatar"

        # Compile the full URL with URI encoding for the parameters
        params = URI.encode_www_form('d' => default, 's' => size)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?#{params}"

        image_tag(gravatar_url, alt: user.name, class: "gravatar rounded-circle", size: "#{size}x#{size}")
    end
end
