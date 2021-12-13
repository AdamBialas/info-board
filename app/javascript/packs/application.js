// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "@fortawesome/fontawesome-free/css/all"
import "bootstrap"
import '../../../vendor/assets/javascripts/mdb.min.js'
import "channels"

//import '../js/bootstrap_js_files.js'
import { } from 'jquery-ujs'
import 'jquery/src/jquery'

import "controllers"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import toastr from 'toastr'
window.toastr = toastr
window.Rails = Rails
import Swal from "sweetalert2/dist/sweetalert2.js"
import "sweetalert2/src/sweetalert2"
window.Swal = Swal

// Behavior after click to confirm button
const confirmed = (element, result) => {
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
    console.log('Hello world!');
};

const allowAction = (element) => {
    if (element.getAttribute('data-confirm-swal') === null) {
        return true;
    }

    showConfirmationDialog(element);
    return false;
};

function handleConfirm(element) {
    if (!allowAction(this)) {
        Rails.stopEverything(element);
    }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);
require("trix")
require("@rails/actiontext")