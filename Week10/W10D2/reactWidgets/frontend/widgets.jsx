import React from "react"
import ReactDom from "react-dom"
import Clock from './clock'
import Tabs from './tabs'

let tabs = [{
    title: 'Numero Uno',
    content: 'Que es esto'
}, {
    title: 'Numero Dos',
    content: 'Yo no se'
}];


// add event listener to document and grab main div render react dom render 
document.addEventListener("DOMContentLoaded", () => {
    let root = document.getElementById("main");
    ReactDom.render(
        <div>
            <Clock />
            <Tabs tabArray={tabs} message={"Hi"}/>
        </div>
    , root);
})