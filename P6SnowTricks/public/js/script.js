//profile Image 
function triggerClick(e) {
  document.querySelector('#profileImage').click();
}
function displayImage(e) {
  if (e.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e){
      document.querySelector('#profileDisplay').setAttribute('src', e.target.result);
    }
    reader.readAsDataURL(e.files[0]);
  }
}
//radio button on sign up 
function triggerClickRadio(e) {
  document.querySelector('#avatarOther').click();
}

//scroll up
mybutton = document.getElementById("scrollUp");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
document.body.scrollTop = 0; // For Safari
document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera

}
//Main Image preview

function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#mainImage')
              .attr('src', e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
  }
}
//multiple files uploads

function preview_image() 
{
 var total_file=document.getElementById("upload_images").files.length;
 for(var i=0;i<total_file;i++)
 {
  $('#image_preview').append("<img class='col-3 m-1 ' src='"+URL.createObjectURL(event.target.files[i])+"'>");
 }
}

//multiple videos upload
$(document).ready(function(){
var i=1;
$('#addVideos').click(function(){
i++;
$('#addFields').append(' <div id="row'+i+'" class="m-3 row "><div class=" col-12 d-flex justify-content-center wrapper"><div class="col-11"><input type="text" name="upload_videos[]" class="mb-1 form-control name_list col-11" /></div><div class="col-1"><button type="button" name="remove" id="'+i+'" class="mx-2 btn btn-danger btn_remove">X</button></div></div></div>')
$(document).on('click', '.btn_remove', function(){
var button_id = $(this).attr("id"); 
$('#row'+button_id+'').remove();
});
});})
//test
