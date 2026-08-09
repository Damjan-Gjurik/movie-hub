//Ova e za dodavanje film vo admin panel
const addBtn = document.getElementById("addActorBtn");
const container = document.getElementById("actorsContainer");

if(addBtn && container){
    addBtn.addEventListener("click", () => {
        const div = document.createElement("div");
        div.className = "actor-item";
        div.innerHTML = `
        <input type="text" name="actor_name[]" placeholder="Име на актер">
        <input type="file" name="actor_image[]" accept="image/*">
        <button type="button" class="removeActor">Избриши</button><br>
        `;
        container.appendChild(div);
    });
    container.addEventListener("click", function(e){
        if(e.target.classList.contains("removeActor")){
            e.target.parentElement.remove();
        }
    });

}

const typeSelect = document.getElementById("typeSelect");
const seriesFields = document.getElementById("seriesFields");

if(typeSelect && seriesFields){
    function toggleSeriesFields(){
        if(typeSelect.value === "Серија"){
            seriesFields.style.display = "block";
        }else{
            seriesFields.style.display = "none";
        }
    }
    toggleSeriesFields();
    typeSelect.addEventListener("change", toggleSeriesFields);
}

const addDirector = document.getElementById("addDirector");
if(addDirector) {
    addDirector.onclick=function(){
        const div=document.createElement("div");
        div.className = "director-row";
        div.innerHTML = `
        <input type="hidden" name="director_id[]">
        <input type="text" name="director_name[]" placeholder="Име на режисер">
        <button type="button" class="removeDirector">Отстрани</button>
        `;
        document.getElementById("directorsContainer").appendChild(div);
    }
}
document.addEventListener("click", function(e) {
    if(e.target.classList.contains("removeDirector")) {
        e.target.parentElement.remove();
    }
});