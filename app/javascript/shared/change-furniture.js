const changeFurniture = () => {
    const furniture = document.querySelector('.furniture-list-item');

    furniture.addEventListener("click", event => {
        // furniture_model = document.getElementById('furniture');
        // furniture_model.setAttribute("src", )
        // furniture.classList.toggle('collapse');
        setTimeout(() => { document.querySelector("a-asset-item").src = "https://poly.googleapis.com/downloads/fp/1600683556850236/cQ0wPsJdliT/8ep1Tdd_Szs/Armchair.gltf" }, 1000)
    })
};

export { changeFurniture }