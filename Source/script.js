document.addEventListener("DOMContentLoaded", function(){
    const searchInput = document.getElementById("search");
    if (searchInput) {
        searchInput.addEventListener("input", function () {
            const text = searchInput.value.toLowerCase().trim();
            document.querySelectorAll(".movie-section").forEach(section => {
                const cards = section.querySelectorAll(".movie-card");
                let visibleCards = 0;
                cards.forEach(card => {
                    const title = card.querySelector("h3").textContent.toLowerCase();
                    if (title.includes(text)) {
                        card.style.display = "";
                        visibleCards++;
                    } else {
                        card.style.display = "none";
                    }
                });
                // Ако нема ниту еден филм во категоријата,
                // ја криеме целата категорија
                if (visibleCards === 0) {
                    section.style.display = "none";
                } else {
                    section.style.display = "";
                }
            });
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

    document.querySelectorAll(".carousel").forEach(carousel => {
        const row = carousel.querySelector(".movie-row");
        const leftBtn = carousel.querySelector(".left-btn");
        const rightBtn = carousel.querySelector(".right-btn");
        rightBtn.addEventListener("click", () => {
            row.scrollBy({
                left: 1000,
                behavior: "smooth"
            });
        });
        leftBtn.addEventListener("click", () => {
            row.scrollBy({
                left: -1000,
                behavior: "smooth"
            });
        });
    });

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
