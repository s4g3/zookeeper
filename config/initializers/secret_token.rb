# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Zookeeper::Application.config.secret_key_base = 'b91f515af41339a9ef56e1457db493b6c0b1ba5937cc0f6383e0105a011d31f2e5fac613dea54a503741e1f54e3deb4819dcabf730ee02696d0d9463d650ed7a'
