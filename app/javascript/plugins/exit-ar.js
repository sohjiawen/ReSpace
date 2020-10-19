const exitAr = () => {
    const navbarItems = document.querySelectorAll(".tab-nav-container a");
    const scene = document.querySelector('a-scene');

    navbarItems.forEach(element => {
        element.addEventListener("click", () => {
            console.log("i have tapped on a nav item");
            if (scene) {
                scene.exitVR();
                console.log('I have exited AR');
            };
        });
    });
};

export { exitAr }