function searchIngredient() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('dose_ingredient_id');
    filter = input.value.toUpperCase();
    ul = document.getElementById("ingredients-list");
    li = ul.getElementsByTagName('li');

    console.log("hello from searchingredient")
    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        p = li[i].getElementsByTagName("p")[0];
        if (p.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }

    };

};

    // var li = document.getElementByClassName("list")




li = document.getElementsByClassName("list");


    for (var i = 0 ; i < li.length; i++) {
   li[i].addEventListener('click' , function(event) {
    console.log(event.target.innerText)
    document.getElementById('dose_ingredient_id').value = event.target.innerText;
   });
}
