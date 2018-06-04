const initTags = () => {
  const form = document.getElementById("form")


  const tags = document.querySelectorAll(".btn-filmy");

  tags.forEach(function(tag){
    tag.addEventListener("click", function() {
      if (this.classList.contains('active')) {
        this.classList.remove('active');
      } else {
        this.classList.add('active');
      }

      document.getElementById("filter-movies").click();
    });
  });


}

export { initTags };
