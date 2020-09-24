import * as THREE from '../build/three.module.js';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
import { ARButton } from '../jsm/webxr/ARButton.js';

var container;
var camera, scene, renderer;
var controller;

var reticle;

var hitTestSource = null;
var hitTestSourceRequested = false;

var model_scale = 0.2;

function init() {
    const page = document.querySelector('#ar-start')
    if (!page) return
    
    container = document.createElement( 'div' );
    document.body.appendChild( container );
    
    scene = new THREE.Scene();
    
    camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 0.01, 20 );
    
    var light = new THREE.HemisphereLight( 0xffffff, 0xbbbbff, 1 );
    light.position.set( 0.5, 1, 0.25 );
    scene.add( light );
    
    //
    
    renderer = new THREE.WebGLRenderer( { antialias: true, alpha: true } );
    renderer.setPixelRatio( window.devicePixelRatio );
    renderer.setSize( window.innerWidth, window.innerHeight );
    renderer.xr.enabled = true;
    container.appendChild( renderer.domElement );
    
    //
    
    document.body.appendChild( ARButton.createButton( renderer, { requiredFeatures: [ 'hit-test' ] } ) );
    
    //
    
    function onSelect() {
        
        if ( reticle.visible ) {
            const url = 'https://cors-anywhere.herokuapp.com/https://poly.googleapis.com/v1/assets/cLydFlVg-wI/?key=AIzaSyA6vXM5PuimkcY3LJ-GtJPX78aAeeWS6xM';
            fetch(url)
            .then(response => response.json())
            .then((data) => {
                const format = data.formats.find( format => { return format.formatType === 'GLTF2'; } );
                console.log(format);
                const gltfLoader = new GLTFLoader();
                const url = format.root.url;
                console.log(url);
                gltfLoader.load(url, (gltf) => {
                    const root = gltf.scene;
                    root.position.setFromMatrixPosition( reticle.matrix );
                    root.scale.set(model_scale, model_scale, model_scale);
                    scene.add(root);
                });
            });
        };
    };
    
    controller = renderer.xr.getController( 0 );
    controller.addEventListener( 'select', onSelect );
    scene.add( controller );
    
    reticle = new THREE.Mesh(
        new THREE.RingBufferGeometry( 0.15, 0.2, 32 ).rotateX( - Math.PI / 2 ),
        new THREE.MeshBasicMaterial()
        );
        reticle.matrixAutoUpdate = false;
        reticle.visible = false;
        scene.add( reticle );
        
        //
        
        window.addEventListener( 'resize', onWindowResize, false );
        
    }
    
    function onWindowResize() {
        
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        
        renderer.setSize( window.innerWidth, window.innerHeight );
        
    }
    
    //
    
    function animate() {
        const page = document.querySelector('#ar-start')
        if (!page) return
        
        renderer.setAnimationLoop( render );
        
    }
    
    function render( timestamp, frame ) {
        
        if ( frame ) {
            
            var referenceSpace = renderer.xr.getReferenceSpace();
            var session = renderer.xr.getSession();
            
            if ( hitTestSourceRequested === false ) {
                
                session.requestReferenceSpace( 'viewer' ).then( function ( referenceSpace ) {
                    
                    session.requestHitTestSource( { space: referenceSpace } ).then( function ( source ) {
                        
                        hitTestSource = source;
                        
                    } );
                    
                } );
                
                session.addEventListener( 'end', function () {
                    
                    hitTestSourceRequested = false;
                    hitTestSource = null;
                    
                } );
                
                hitTestSourceRequested = true;
                
            }
            
            if ( hitTestSource ) {
                
                var hitTestResults = frame.getHitTestResults( hitTestSource );
                
                if ( hitTestResults.length ) {
                    
                    var hit = hitTestResults[ 0 ];
                    
                    reticle.visible = true;
                    reticle.matrix.fromArray( hit.getPose( referenceSpace ).transform.matrix );
                    
                } else {
                    
                    reticle.visible = false;
                    
                }
                
            }
            
        }
        
        renderer.render( scene, camera );
        
    }
    
    export { init, animate }