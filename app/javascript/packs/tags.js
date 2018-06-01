

form = document.getElementById("form")


tags = document.querySelectorAll(".btn-filmy");

tags.forEach(function(tag){
  tag.addEventListener("click", function() {
    if (this.classList.contains('active')) {
      this.classList.remove('active');
    } else {
      this.classList.add('active');
    }

    document.getElementById("filter-moives").click();
  });
});




