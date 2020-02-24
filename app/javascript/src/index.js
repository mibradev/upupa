import $ from "jquery"
import "bootstrap"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="popover"]').popover()
  $('[data-toggle="tooltip"]').tooltip()
})
