var slider = document.getElementById("myRange");
var output = document.getElementById("demo");

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
  let x = parseInt(this.value);

  if (x < movie_length - 5){

    for (i = 0; i < movie_length; i++) {
      document.getElementById(`my-movie${i}`).classList.add("display-none");
    }
    for (i = 0; i < 6; i++){
      document.getElementById(`my-movie${x+i}`).classList.remove("display-none");
    }
  }
}
