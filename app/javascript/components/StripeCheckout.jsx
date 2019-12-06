import React from "react"
import PropTypes from "prop-types"

class StripeCheckout extends React.Component {
  render () {
    const {successUrl, cancelUrl} = this.props
    var stripe = Stripe('pk_test_J8uSjjxfp1g7IIrYiJlZPUQf00MqokWqCV');

    var checkoutButton = document.querySelector('#checkout-button');
    checkoutButton.addEventListener('click', function () {
      stripe.redirectToCheckout({
        items: [{
          sku: 'certificate',
          quantity: 1,
        }],
        successUrl: successUrl,
        cancelUrl: cancelUrl
      });
    });

    return (
      <React.Fragment>
      </React.Fragment>
    );
  }
}

export default StripeCheckout
