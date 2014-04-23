# Rails.configuration.stripe = {
#   :publishable_key => 'sk_test_nhmbYZnBYW8FZddkhsTi17wY',
#   :secret_key      => 'pk_test_aiccHNPwfopfbYLNLpuViRzI'
# }

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


# PUBLISHABLE_KEY=pk_test_aiccHNPwfopfbYLNLpuViRzI SECRET_KEY=sk_test_nhmbYZnBYW8FZddkhsTi17wY rails s