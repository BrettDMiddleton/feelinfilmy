const initTags = () => {
  const form = document.getElementById("form")
  const tags = document.querySelectorAll(".btn-filmy2");

  tags.forEach(function(tag){
    tag.addEventListener("click", function() {
     this.classList.toggle('active')
      document.getElementById("filter-movies").click();
    });
  });
}

export { initTags };
