const autoEnterAr = () => {
    const scene = document.querySelector('a-scene');
    if (scene.hasLoaded) {
        scene.enterAR();
    };
    console.log("I am in AR");
};

export { autoEnterAr }