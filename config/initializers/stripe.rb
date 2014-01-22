Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PK_TEST'],
  :secret_key      => ENV['STRIPE_SK_TEST']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]