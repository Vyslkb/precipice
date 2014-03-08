Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PK_LIVE'],
  :secret_key      => ENV['STRIPE_SK_LIVE']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# stripe
