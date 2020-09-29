const selectFurniture = () => {
    const ar_collapse = document.getElementById('ar-collapse');
    if (ar_collapse) {
        const ar_furniture = document.querySelector('.furniture-list-item');
        ar_furniture.addEventListener('click', ev => {
            ar_collapse.classList.toggle('show');
        });
    };
}

export { selectFurniture }