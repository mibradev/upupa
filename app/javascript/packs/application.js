require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

import "channels"
import "controllers"

import $ from "jquery"
import "bootstrap"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="popover"]').popover()
  $('[data-toggle="tooltip"]').tooltip()
})
