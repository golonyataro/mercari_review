$(function(){
  var image = document.getElementById("item-image");
  var image_viw = document.getElementById("image_viw");

  var url = location.href
  if(url === "http://localhost:3000/items/new" || ""){
    image.addEventListener("change", function(){
      $('#camera-icon').css({"padding":"60px 223px"})
      URL.revokeObjectURL(image_viw.src);
      image_viw.src = URL.createObjectURL(image.files[0]);
    });
  }
})