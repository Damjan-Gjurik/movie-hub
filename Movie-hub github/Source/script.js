document.addEventListener("DOMContentLoaded", function(){
const searchInput = document.getElementById("search");
if (searchInput) {
    searchInput.addEventListener("keyup", function () {
        const text = searchInput.value.toLowerCase();
        const cards = document.querySelectorAll(".movie-card");
        cards.forEach(card => {
            const title = card.querySelector("h3").textContent.toLowerCase();
            if (title.includes(text)) {
                card.style.display = "flex";
            } else {
                card.style.display = "none";
            }
        });
    });
}
});

const menuBtn = document.getElementById("menuBtn");
const dropdown = document.getElementById("dropdownMenu");

if(menuBtn && dropdown){
    menuBtn.addEventListener("click", () => {
        dropdown.classList.toggle("hidden");
    });
    document.addEventListener("click", function(event){
        if(!menuBtn.contains(event.target)&&!dropdown.contains(event.target)){
            dropdown.classList.add("hidden");
        }
    });
}

document.querySelectorAll(".watchlist-btn").forEach(button => {
    button.addEventListener("click", function(){
        fetch("watchlist.php",{
            method:"POST",
            headers:{
                "Content-Type":"application/x-www-form-urlencoded"
            },
            body:"movie_id="+this.dataset.id
        })
        .then(response=>response.text())
        .then(data=>{
            this.innerHTML="✔ Added";
            this.disabled=true;
        });
    });
});
