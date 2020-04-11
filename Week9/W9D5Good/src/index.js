const DOMNodeCollection = require('./dom_node_collection.js');

function $1(oneArg) {
    
  if ((oneArg instanceof HTMLElement) || (typeof oneArg === "string")) { 
    let args = document.querySelectorAll(oneArg)
    let newArgs = Array.from(args); 
    return new DOMNodeCollection(newArgs); 
  } else {
    return undefined;
  }
}

window.$1 = $1; 
window.DOMNodeCollection = DOMNodeCollection; 