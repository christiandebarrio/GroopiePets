// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  "use strict";

  function getPetInfo (event) {
    event.preventDefault();
    var petId = event.currentTarget.getAttribute("data-id");

    var request = $.get("api/pet/" + petId + "/info");

    function onRequestSuccess (response) {     
      console.log(response);
      showPetInfo(response);
    }

    function onRequestFailure (err) {
      console.log(err.responseJSON);
    }

    request.done(onRequestSuccess);
    request.fail(onRequestFailure);
  }

  $(".container").on("click", ".panel-pet-title", getPetInfo);

  function showPetInfo(response) {
    $(".pet-name").text(response.name)
    $(".pet-species").text(response.species)
    $(".pet-age").text(response.age)

    $(".modal").modal("show");
  }

});