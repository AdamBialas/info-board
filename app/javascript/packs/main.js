console.log("posts.js loaded");

$(document).ready(function(){
 $("#comments").on("click", function(event) {
    $.get("/infos/13/like", function(data) {
        console.log('data');
        alert("Load was performed.");
      });
  });
});