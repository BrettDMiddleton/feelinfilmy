// Update the current slider value (each time you drag the slider handle)

// const setSlider = (elementName, movieElementName, movie_length) => {
//   const slider = document.getElementById(elementName);

//   console.log('setSlider', arguments);
//   if (slider) {
//     slider.oninput = function() {
//       let x = parseInt(this.value);


//       for (i = 0; i < movie_length; i++) {
//         document.getElementById(`${movieElementName}${i}`).classList.add("display-none");
//       }
//       for (i = 0; i < 4; i++){
//         document.getElementById(`${movieElementName}${x+i}`).classList.remove("display-none");
//       }
//     }
//   }

//   for (i = 0; i < movie_length; i++) {
//     document.getElementById(`${movieElementName}${i}`).addEventListener("mouseover", function(){
//       makeVisible(this.id)
//     });
//     document.getElementById(`${movieElementName}${i}`).addEventListener("mouseout", function(){
//       makeInvisible(this.id)
//     });
//   }
// }

// function makeVisible(x){
//   document.getElementById(`${x}hover`).classList.remove("display-none");
// }
// function makeInvisible(x){
//   document.getElementById(`${x}hover`).classList.add("display-none");
// }

const switchTab = (event) => {
  const catalogue = document.getElementById('my-catalogue');
  const watchlist = document.getElementById('my-watchlist');

  if (watchlist && watchlist.classList.contains('display-none')) {
    // setSlider('myRange', 'my-movie', movie_length);
  }

  if (false) {

      //setSlider('myRange', 'my-movie', movie_length2);
    }
};
