AFRAME.registerComponent("exit-ar-button", {
    schema: {
      // 	selector: Calls querySelector (e.g., "#box" to <a-entity id="box">)
      element: { type: "selector" }
    },
    init: function() {
      this.data.element.addEventListener("click", ev => {
        this.el.sceneEl.renderer.xr.getSession().end();
      });
    }
  });
  