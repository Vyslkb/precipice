# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  if $('body').data('controller') == 'customer_orders' 
    if $('body').data('action') == 'new'
      Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
      customer_order.setupForm()
      customer_order.checkoutFormUi()
      customer_order.formValidation()
      #customer_order.duplicateNameFields()
      
customer_order =
  setupForm: ->
    $('#new_customer_order').submit ->
      $('input[type=submit]').attr('disabled', true)
      $("#spinner").show()
      customer_order.processCard()
      false #stop normal submission
      
  processCard: ->
    card =
      {number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      expMonth: $('#card_month').val(),
      expYear: $('#card_year').val()}
    
    Stripe.createToken(card, customer_order.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#stripe_card_token').val(response.id)
      $('#new_customer_order')[0].submit()
      #alert response.id
    else
       $("#spinner").hide()
      $('#stripe_error').text(response.error.message)
      $('#stripe_error').parent().removeClass("hidden")
      $('input[type=submit]').attr('disabled', false)
  
  checkoutFormUi: -> 
    $('*[data-content="checkout-pager"]').click ->
      if $(this).data('pager-type') == "forward"
        unless $(this).parent('li').hasClass("disabled")
          $('*[data-content="checkout-page"]').addClass("hidden")
          $('*[data-id="' + $(this).data("show-page") + '"]').removeClass("hidden")
      else
        $('*[data-content="checkout-page"]').addClass("hidden")
        $('*[data-id="' + $(this).data("show-page") + '"]').removeClass("hidden")
    
  formValidation: -> 
    validator = $('#new_customer_order').validate()
    
    $('#customer_order_zip_code').rules('add',{ 
       required: true,
       digits: true,
       minlength: 5,
       maxlength: 5
       }
    )    
    
    
    $('#card_number').payment('formatCardNumber')
     
    customer_order.validateEachPage(validator)
  
  validateEachPage: (validator) ->    
    $('input', '*[data-id="checkout-step-1"]').on('input focusin',  ->
      valid_state = true
      
      $('input', '*[data-id="checkout-step-1"]').each ->
        if validator.element( $(this)) == false
          valid_state = false
          
      if valid_state == true
        $('*[data-show-page="checkout-step-2"]').parent('li').removeClass("disabled")
      else 
        $('*[data-show-page="checkout-step-2"]').parent('li').addClass("disabled")
      )
    
    # Not DRY, but whatever
    $('input', '*[data-id="checkout-step-2"]').on('input focusin',  ->
      valid_state = true
      
      $('input', '*[data-id="checkout-step-2"]').each ->
        if validator.element( $(this)) == false
          valid_state = false
          
      if valid_state == true
        $('*[data-show-page="checkout-step-3"]').parent('li').removeClass("disabled")
      else 
        $('*[data-show-page="checkout-step-3"]').parent('li').addClass("disabled")
      )
        
  
  
  duplicateNameFields: ->
    
    #THis seems to screw up validation
    $('#customer_order_first_name').change ->
       $('#customer_order_ship_to_first_name').val($(this).val())
    $('#customer_order_last_name').change ->
       $('#customer_order_ship_to_last_name').val($(this).val())
   
   
   
     
   