var slider = document.getElementById("myRange");

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
  let x = parseInt(this.value);


  for (i = 0; i < movie_length; i++) {
    document.getElementById(`my-movie${i}`).classList.add("display-none");
  }
  for (i = 0; i < 4; i++){
    document.getElementById(`my-movie${x+i}`).classList.remove("display-none");
  }
}


for (i = 0; i < movie_length; i++) {
  document.getElementById(`my-movie${i}`).addEventListener("mouseover", function(){
    makeVisible(this.id)
  });
    document.getElementById(`my-movie${i}`).addEventListener("mouseout", function(){
    makeInvisible(this.id)
  });

}
function makeVisible(x){
  document.getElementById(`${x}hover`).classList.remove("display-none");
}
function makeInvisible(x){
  document.getElementById(`${x}hover`).classList.add("display-none");
}
