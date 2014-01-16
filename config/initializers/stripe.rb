Rails.configuration.stripe = {
  #:publishable_key => ENV['PUBLISHABLE_KEY'],
  #:secret_key      => ENV['SECRET_KEY']
  
  :publishable_key => "pk_test_g3HObSqETeqMyshOepZY2QFB",
  :secret_key      => "sk_test_DtlutWbhRy1T629i5mrocR56"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]