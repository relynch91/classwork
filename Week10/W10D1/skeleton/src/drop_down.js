import { htmlGenerator } from "./warmup";

const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator () {
  let dogLinks = [];
  for (let i = 0; i < Object.keys(dogs).length; i++) {
    let newElement = document.createElement('a');
    newElement.innerHTML = Object.keys(dogs)[i];
    newElement.href = Object.values(dogs)[i];
    let newItem = document.createElement('li');
    newItem.classList.add('dog-link');
    newItem.append(newElement);
    dogLinks.push(newItem);
  }
  return dogLinks;
}

function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  const list = document.getElementsByClassName("drop-down-dog-list");
  for (let i = 0; i < dogLinks.length; i ++) {
    list[0].append(dogLinks[i]);
  }
}  
attachDogLinks();

const hover = document.getElementById("pup");

hover.addEventListener("click", function () {
  alert("hello who dis")
});

// function handleEnter() {
//   return attachDogLinks();
// }

// function handeLeave() {
//   linked.classList.removeClass('dog-link');
// }

// const linked = document.getSelection('dog-link');
// linked.addEventListener();