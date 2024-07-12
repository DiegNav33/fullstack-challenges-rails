// TODO: write your code here!
document.addEventListener("DOMContentLoaded", () => {
  const allElt = document.querySelectorAll(".clickable");
  allElt.forEach((element) => {
    element.addEventListener("click", (event) => {
      element.classList.toggle("active");
      console.log("Activated!");
    });
  });
});
