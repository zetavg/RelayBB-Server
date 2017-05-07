AuthProvider.configure do
  # Set the default type of the resource owner
  default_resource_owner_type "User"

  # This block will be called to get the authenticated resource owner
  # by his/her credentials
  resource_owner_from_credentials do |type, username, password|
    resource_owner_class = case type
    when "User"
      User
    end

    resource_owner = resource_owner_class.find_by(username: username)

    if resource_owner&.valid_password?(password)
      resource_owner
    else
      nil
    end
  end

  # Access token expiration time (defaults to 2 hours)
  # access_token_expires_in 2.hours
end
