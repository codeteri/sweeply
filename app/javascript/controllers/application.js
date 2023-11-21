import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener("turbo:load", () => {
  const dropdownElement = document.querySelector('#dropdownMenuButton');
  const dropdown = new Dropdown(dropdownElement);
});
