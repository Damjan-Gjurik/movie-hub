//Ova e za edit na film
const addActor = document.getElementById("addActor");
if(addActor) {
    addActor.addEventListener("click", function(){
        const div=document.createElement("div");
        div.className = "actor-item";
        div.innerHTML = 
        `<input class="actor-fields" type="hidden" name="actor_id[]">
         <input class="actor-fields" type="text" name="actor_name[]">
         <input class="actor-fields" type="file" name="actor_image[]">
         <button type="button" class="removeActor">Отстрани</button>`
        document.getElementById("actorsContainer").appendChild(div);
    });
}
document.addEventListener("click", function(e){
    if(e.target.classList.contains("removeActor")){
        e.target.parentElement.remove();
    };
});

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

function toggleSeriesFields() {
    const seasonInput = document.querySelector('input[name="seasons"]');
    const episodeInput = document.querySelector('input[name="episodes"]');
    if(typeSelect.value === "Серија"){
        seriesFields.style.display = "block";
        seasonInput.disabled = false;
        episodeInput.disabled = false;
    }else{
        seriesFields.style.display = "none";
        seasonInput.disabled = true;
        episodeInput.disabled = true;
    }
}
