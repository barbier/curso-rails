document.addEventListener("turbolinks:load", () => {
  const form = document.getElementById("save_views")
  if(form !== null) form.submit()
})