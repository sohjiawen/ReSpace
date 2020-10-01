import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  connect() {
    setInterval(this.addToCart, 500);
  }

  addToCart = () => {
    fetch('/furnitures', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = data.cart.length;
      });
  }
}