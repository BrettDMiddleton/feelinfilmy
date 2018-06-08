import swal from 'sweetalert';

const initTags = () => {
  const form = document.getElementById("form")
  const tags = document.querySelectorAll(".btn-filmy2");

  tags.forEach(function(tag){
    tag.addEventListener("click", function() {
      if (this.classList.contains("film2-genre")){
       this.classList.toggle('active1')
       document.getElementById("filter-movies").click();
     }
      else if (this.classList.contains("film2-tag")){
       this.classList.toggle('active2')
       document.getElementById("filter-movies").click();
     }
   });
  });
}

export { initTags };
