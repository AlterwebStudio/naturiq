const numberedIndexes = document.querySelectorAll('.numbered-index');

numberedIndexes.forEach(function(numberedIndex){
  const nr = numberedIndex.getAttribute("data-number");

  const nrContainer = document.createElement("span");
        nrContainer.innerHTML = nr;
        nrContainer.classList.add("number");

  numberedIndex.appendChild(nrContainer);
})
