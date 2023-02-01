// schedule-manager stimulus controler will manage close day and multiple slot days checkboxes

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="schedule-manager"
export default class extends Controller {
  static targets = [
    "closedDay",
    "multipleSlots",
    "openingHours",
    "openingHourMs",
    "open",
    "close",
    "multipleSlotsCheck",
  ];

  connect() {
    console.log("connected to schedule manager controlle");
    // checkIfMultipleSlots method is added in the connect in case the page needs
    // to be refreshed when validation error in form.
    // In this way, if the multiple slot was checked, when the page is refreshed
    // the open_at_ms and close_at_ms are displayed back
    this.checkIfMultipleSlots();

    // Same reason for checkIfClosed method in case of edit, we want the
    // the open_at and close_at to be hidden
    this.checkIfClosed();
  }

  // checkIfClosed method will check the status of the closed checkbox.
  // If it's checked, the stimulus controller will hide the opening hour fields
  // so the user cannot enter them
  checkIfClosed() {
    // openingHours is an array of all openingHourTargets (managing open_at and close_at fields)
    let openingHours = this.openingHoursTargets;
    // multipleSlotsCheck is an array of all multipleSlotsCheckTargets (managing ms checkboxes)
    let multipleSlotsCheck = this.multipleSlotsCheckTargets;

    // iteration over all closed checkboxes (i.e for each weekday)
    // if the checkbox is checked then we hide the open_at and close_at fields and the ms checkbox
    // if unchecked, we display back open_at and close_at fields and the ms checkbox
    this.closedDayTargets.forEach(function (elem, i) {
      if (elem.checked) {
        console.log(open[i]);

        openingHours[i].classList.add("d-none");
        multipleSlotsCheck[i].classList.add("d-none");
      } else {
        openingHours[i].classList.remove("d-none");
        multipleSlotsCheck[i].classList.remove("d-none");
      }
    });
  }

  checkIfMultipleSlots() {
    // openingHoursMs is an array of all openingHourMsTargets (managing open_at_ms and close_at_ms fields)
    let openingHourMs = this.openingHourMsTargets;

    // iteration over all multiple slots checkboxes (i.e for each weekday)
    // if the checkbox is checked then we display the open_at_ms and close_at_ms fields
    // if unchecked, we hide the open_at_ms and close_at_ms fields
    this.multipleSlotsTargets.forEach(function (elem, i) {
      if (elem.checked) {
        openingHourMs[i].classList.remove("d-none");
      } else {
        openingHourMs[i].classList.add("d-none");
      }
    });
  }
}
