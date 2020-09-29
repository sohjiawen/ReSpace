AFRAME.registerSystem("ar-hit-test", {
    schema: {
        reticle: { type: "selector" }
    },
    
    init: function() {
        this.xrHitTestSource = null;
        this.viewerSpace = null;
        this.refSpace = null;
        this.selectedFurniture = null;
        this.selected = false;
        this.el.sceneEl.enterAR();
        
        this.el.sceneEl.renderer.xr.addEventListener("sessionend", ev => {
            this.viewerSpace = null;
            this.refSpace = null;
            this.xrHitTestSource = null;
        });
        this.el.sceneEl.renderer.xr.addEventListener("sessionstart", ev => {
            console.log("session has started");
            let session = this.el.sceneEl.renderer.xr.getSession();
            // 'element' refers to the reticle
            console.log(this.data.reticle.attributes);
            let element = this.data.reticle
            // Using the 'select' event listener, when the user taps the screen,
            // the object will be placed in the camera view based on the pose of the reticle
            session.addEventListener("select", () => {
                console.log(element.getAttribute('position'));
                if (!element || !this.selectedFurniture) return;
                console.log("i am setting models in the screen");
                this.selectedFurniture.setAttribute('position', element.getAttribute('position'));
                console.log(element.getAttribute('position'));
                console.log(this.selectedFurniture.getAttribute('position'));
                this.selectedFurniture.setAttribute('visible', 'true');
            });
            
            session.requestReferenceSpace("viewer").then(space => {
                this.viewerSpace = space;
                session 
                .requestHitTestSource({ space: this.viewerSpace })
                .then(hitTestSource => {
                    this.xrHitTestSource = hitTestSource;
                });
            });
            
            session.requestReferenceSpace("local-floor").then(space => {
                this.refSpace = space;
            });
        });
    },
    
    setSelectedFurniture: function(id) {
        console.log("i'm in setSelectedFurniture");
        this.selectedFurniture = this.el.sceneEl.querySelector(id);
        this.selected = true;
        console.log(this.selectedFurniture);
    },
    
    tick: function() {
        if (this.el.sceneEl.is("ar-mode")) {
            if (!this.viewerSpace || !this.data.reticle) return;
            
            let frame = this.el.sceneEl.frame;
            let xrViewerPose = frame.getViewerPose(this.refSpace);
            
            // To draw anything in AR, I need to know where the viewer (this.xrHitTestSource) is
            // and where they're looking (xrViewerPose).
            // So I test that hitTestSource and the xrViewerPose are still valid.
            if (this.xrHitTestSource && xrViewerPose) {
                // Now I call getHitTestResults(). It takes the hitTestSource as an argument and returns
                // an array of HitTestResult instances.
                let hitTestResults = frame.getHitTestResults(
                    this.xrHitTestSource
                    );
                    
                    // The hit test may find multiple surfaces. The first one in the array is the one closest to the camera.
                    if (hitTestResults.length > 0) {
                        // Finally, I need to process the hit test results. The basic process is this.
                        // Get a pose from the hit test result, transform (move) the reticle image to the hit test position.
                        // The pose represents the pose of a point on a surface.
                        let pose = hitTestResults[0].getPose(this.refSpace);
                        
                        let inputMat = new THREE.Matrix4();
                        inputMat.fromArray(pose.transform.matrix);
                        
                        let position = new THREE.Vector3();
                        position.setFromMatrixPosition(inputMat);
                        this.data.reticle.setAttribute("position", position);
                    }
                }
            }
        }
    });