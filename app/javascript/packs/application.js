import "bootstrap";
import "movie_caroussel";

import { initTags } from "./../components/tag.js";

initTags();

$("#slideshow > div:gt(0)").hide();

setInterval(function() {
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
}, 3000);
