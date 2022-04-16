document.addEventListener("turbolinks:load", () => {
  const closebtn = document.querySelector("#flashCloseBtn");
  closebtn.addEventListener("click", (e) => {
    e.target.parentElement.remove();
  });
});
