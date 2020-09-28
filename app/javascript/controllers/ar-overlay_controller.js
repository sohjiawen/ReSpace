import { Controller } from "stimulus";

export default class extends Controller {

  getIndex(event) {
    const scene = document.querySelector('a-scene');
    console.log(event.currentTarget.dataset.furnitureId)
    scene.systems['ar-hit-test'].setSelectedFurniture(event.currentTarget.dataset.furnitureId);
  }
}