const themes = () => {
  const form = document.getElementById("new_user_theme");
  if (form) {
    const images = document.querySelectorAll(".theme-img");
    images.forEach((image) => {
      image.addEventListener('click', () => {
        const checkBoxId = image.dataset.checkboxId;
        const checkBox = document.getElementById(checkBoxId);
        checkBox.checked = true;
        form.submit();
      });
    });
  };
};

export {themes};
