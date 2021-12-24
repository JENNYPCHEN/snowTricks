//profile Image
function triggerClick(e) {
  document.querySelector("#profileImage").click();
}
function displayImage(e) {
  if (e.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      document
        .querySelector("#profileDisplay")
        .setAttribute("src", e.target.result);
    };
    reader.readAsDataURL(e.files[0]);
  }
}

//radio button on sign up
function triggerClickRadio(e) {
  document.querySelector("#avatarOther").click();
}

//scroll up
mybutton = document.getElementById("scrollUp");
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
  scrollFunction();
};
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
      $("#mainImage").attr("src", e.target.result);
    };
    reader.readAsDataURL(input.files[0]);
  }
}

//multiple files uploads
function preview_image() {
  var total_file = document.getElementById("trick_images").files.length;
  for (var i = 0; i < total_file; i++) {
    $("#image_preview").append(
      "<img class='col-3 m-1 'src='" +
        URL.createObjectURL(event.target.files[i]) +
        "'>"
    );
  }
}

//multiple videos upload
jQuery(document).ready(function () {
  var index = 0;
  $(".addVideos").click(function () {
    index++;
    $(".addFields").append(
      '<div id="row' +
        index +
        '" class="m-3 row d-flex justify-content-start "><div class="col-11"><input id="trick_videos_' +
        index +
        '_path"name="trick[videos][' +
        index +
        '][path]"class="form-control"/></div><div class="col-1"><button type="button" name="remove" id="' +
        index +
        '" class="mx-2 btn btn-danger btn_remove">X</button></div></div></div>'
    );
    $(document).on("click", ".btn_remove", function () {
      var button_id = $(this).attr("id");
      $("#row" + button_id + "").remove();
    });
  });
});

//trick loadMore 
$(document).ready(function(){
  $(".display").slice(0, 10).show();
  $("#loadMore").on("click", function(e){
    e.preventDefault();
    $(".display:hidden").slice(0, 5).slideDown();
    if($(".display:hidden").length == 0) {
      $("#loadMore").text("").addClass("noContent");
    }
  }); 
})
//comment loadMore
$(document).ready(function(){
  $(".displayComments").slice(0, 5).show();
  $("#loadMoreComments").on("click", function(e){
    e.preventDefault();
    $(".displayComments:hidden").slice(0, 5).slideDown();
    if($(".displayComments:hidden").length == 0) {
      $("#loadMoreComments").text("").addClass("noContent");
    }
  });
})
// ajax delete image/video
window.onload = () => {
	let links = document.querySelectorAll("[data-delete]");
	for (link of links) {
		link.addEventListener("click", function (e) {
			e.preventDefault();
			if (confirm("Confirmer la suppression (immédiate et définitive) ?")) {
				fetch(this.getAttribute("href"), {
					method: "DELETE",
					headers: {
						"X-Requested-With": "XMLHttpRequest",
						"Content-Type": "application/json"
					},
					body: JSON.stringify({"_token": this.dataset.token})
				}).then(
					(response) => response.json()
				).then((data) => {
					if (data.success)
          
						this.parentElement.remove();
					else
						alert(data.error);
				}).catch(e => alert(e));
			}
		});
	}
};