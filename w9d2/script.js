document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const sfForm = document.getElementById("sf-form");
  sfForm.addEventListener("submit", event => {
    event.preventDefault();

    const favInput = document.getElementsByClassName("favorite-input")[0];
    const sfInput = favInput.value;
    favInput.value = '';

    const ul = document.getElementById("sf-places");
    const li = document.createElement('li');
    li.textContent = sfInput;
    ul.appendChild(li);
  });


  // adding new photos

  // --- your code here!

  const togglePhoto = document.getElementsByClassName('photo-show-button')[0];
  const photoForm = document.getElementsByClassName('photo-form-container')[0];
  togglePhoto.addEventListener('click', event => {
    photoForm.classList.contains('hidden')
    ? photoForm.classList.remove('hidden')
    : photoForm.classList.add('hidden');
  });

  photoForm.addEventListener("submit", event => {
    event.preventDefault();

    const photoInput = document.getElementsByClassName("photo-url-input")[0];
    const photoURL = photoInput.value;
    photoInput.value = '';

    const ul = document.getElementsByClassName('dog-photos')[0];
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.src = photoURL;
    li.append(img);
    ul.append(li);
  })


});
