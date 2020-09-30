const selectFurniture = () => {
    const ar_collapse = document.getElementById('ar-collapse');
    if (ar_collapse) {
        const ar_furniture = document.querySelectorAll('.furniture-list-item');
        if (ar_furniture) {
            ar_furniture.addEventListener('click', ev => {
            ar_collapse.classList.toggle('show');
        });
        } 
    };
}

export { selectFurniture }