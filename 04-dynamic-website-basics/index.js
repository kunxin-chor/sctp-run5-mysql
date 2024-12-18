const express = require('express');
const hbs = require('hbs');

const app = express();

// inform express that we are using hbs as the view engine
app.set('view engine', 'hbs');

app.get("/", function(req,res){
    res.send("<h1>Hello World</h1>");
})

app.get("/about-us", function(req,res){
    // res.render will read the content of
    // the given file and send it back
    // to the client as HTML

    // 2nd parameter is an object
    // The KEYS are the variables in the hbs file
    // The VALUE ar the value to assign
    
    // NOTES
    // 1. the file extension can be omitted
    // 2. the file path is relative to the views folder
   res.render('about-us', {
     companyName: "ACME Pte Ltd",
     year: new Date().getFullYear()
   });
})

app.listen(3000, function(){
    console.log("Server has started");
})