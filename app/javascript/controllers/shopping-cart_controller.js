import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  connect() {
    setInterval(this.addToCart, 100);
  }

  addToCart = () => {
    fetch('/furnitures', { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = data.cart.length;
      });
  }
}