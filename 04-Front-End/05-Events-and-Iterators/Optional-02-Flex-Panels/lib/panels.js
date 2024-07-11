document.addEventListener("DOMContentLoaded", () => {
  const allPanels = document.querySelectorAll(".panel");
  allPanels.forEach(panel => {
    panel.addEventListener("click", (event) => {
      allPanels.forEach(otherPanel => {
        if (otherPanel !== panel) {
          otherPanel.classList.remove("panelOpened");
        }
      });
      panel.classList.toggle("panelOpened");
    });
  });
});
