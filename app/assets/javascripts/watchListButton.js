function watchListButton(event, form) {
  event.preventDefault();

  swal({
    title: "Added to Watchlist!",
    icon: "success"
  });

  form.submit();
}
