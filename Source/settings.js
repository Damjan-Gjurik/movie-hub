const input = document.getElementById("profile_picture");
if(input){
    input.addEventListener("change",function(){
        const file=this.files[0];
        if(!file) return;
        const reader=new FileReader();
        reader.onload=function(e){
            document.querySelector(".profile-picture img").src=e.target.result;
        }
        reader.readAsDataURL(file);
    });
}

const modal = document.getElementById("deleteModal");
const openBtn = document.getElementById("openDeleteModal");
const cancelBtn = document.getElementById("cancelDelete");

openBtn.addEventListener("click", function(e){
    e.preventDefault();
    modal.style.display = "flex";
})
cancelBtn.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(e) {
    if(e.target == modal) {
        modal.style.display = "none";
    }
}