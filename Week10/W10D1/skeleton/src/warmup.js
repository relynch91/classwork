const partyHeader = document.getElementById('party'); 
// ^^^ this grabs all element objects with the id: 'party' tag
// from clock.js class;
// const clock = new Clock();
// const time = document.getElementById("clock");

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.hasChildNodes()) {
            htmlElement.removeChild(htmlElement.childNodes[0]);
    }
    let newElement = document.createElement('p');
    newElement.innerHTML = string;
    htmlElement.append(newElement);
};

htmlGenerator('Party Time.', partyHeader);
