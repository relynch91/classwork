class DOMNodeCollection {
    constructor(htmlElementsArray) {
        this.htmlElementsArray = htmlElementsArray;
    }

    html(args = undefined) { 
      
        if (args === undefined) { 
            return this.htmlElementsArray[0].innerHTML; 
        } else { 
            for (let i = 0; i < this.htmlElementsArray.length; i++) {
                this.htmlElementsArray[i].innerHTML = args; 
            }
        }

        return true; 
    }

    empty() { 
        for (let i = 0; i < this.htmlElementsArray.length; i++) {
            this.htmlElementsArray[i].innerHTML = "";
        }

        return true; 
    }

    append(args) { 
        let outer = ""; 
        for (let i = 0; i < args.length; i++) { 
            outer += args[i]; 
        }
        for (let j = 0; j < this.htmlElementsArray; j++) { 
            this.htmlElementsArray[i].innerHTML += outer; 
        }

        return true; 
    }

    attr() {
        return this.htmlElementsArray.map (ele => {
            return ele.attributes;
        })
    };

    addClass(string) {
        for (let i = 0; i <this.length; i ++) {
            let ele = this.htmlElementsArray[0];
            ele.setAttribute("class", string);
        }
    }

    removeClass (string) {
        for (let i = 0; i < this.length; i++) {
            let ele = this.htmlElementsArray[0];
            ele.removeAttribute(string);
        }
    }

    children() {
        let queue = [];
        let args = this.htmlElementsArray;

        for (let i = 0; i < args.length; i ++) {
            queue = queue.concat(args[i].children())
        }

        return new DomNodeCollection(queue);
    }

    parent() {
        let queue = [];
        let args = this.htmlElementsArray;

        for (let i = 0; i < args.length; i++) {
            queue = queue.concat(args[i].parent)
        }

        return new DomNodeCollection(queue)
    }
}

module.exports = DOMNodeCollection;