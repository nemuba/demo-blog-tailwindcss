// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


window.addEventListener("turbo:load", () => {
  const btn = document.querySelector("button.mobile-menu-button");
  const menu = document.querySelector(".mobile-menu");

  btn.addEventListener("click", () => {
    menu.classList.toggle("hidden");
  });
})
