class HomeController < ApplicationController

  def index
    @full = true
    redirect_to user_root_path if current_user
  end

  def checkout
    return redirect_to '/profile' if !current_user&.profile&.complete
    return redirect_to '/videos' if current_user&.purchased
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: 'Certificate Course',
    #     description: 'Certificate Course',
    #     images: ['https://example.com/t-shirt.png'],
    #     amount: 2000,
    #     currency: 'usd',
    #     quantity: 1,
    #   }],
    #   success_url: "#{request.base_url}/videos?session_id={CHECKOUT_SESSION_ID}",
    #   cancel_url: "#{request.base_url}/checkout",
    # )
    @props = {
      successUrl: "#{request.base_url}/videos?session_id={CHECKOUT_SESSION_ID}&success=true",
      cancelUrl: "#{request.base_url}/checkout",
    }
  end
end
