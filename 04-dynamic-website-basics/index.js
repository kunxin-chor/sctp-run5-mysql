const express = require('express');
const hbs = require('hbs');
const waxOn = require('wax-on');

const app = express();

// setup waxon
waxOn.on(hbs.handlebars); // hbs.handlebars will refer to the geneic version of handlebars
waxOn.setLayoutPath('views/layouts');

// inform express that we are using hbs as the view engine
app.set('view engine', 'hbs');

// set up static file
// app.use --> setup a middleware that affects all routes
// (ie. a global middleware)
// if the request is for a static file (image or CSS or JS etc.)
// then get it from the folder stated as the first parameter
// (in this case, the folder public)
app.use(express.static('public'));

app.get("/", function(req,res){
    res.render('home')
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
});

app.get('/contact-us', function(req,res){
    res.render('contact-us')
})

app.listen(3000, function(){
    console.log("Server has started");
})