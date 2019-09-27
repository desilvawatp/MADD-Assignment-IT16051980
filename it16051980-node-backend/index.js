var bp = require('body-parser');
var express = require('express');
var app = express();

app.use(bp());

var users = {
    "test@test.test": "test"
};

app.get('/items/all', (req, res, next) => {
    var items = [
        { name: "Hair Dryer", price: 8500.0, description: "Philips Hair Dryer", imageURL: "https://3.bp.blogspot.com/-VsT-CRJvpXI/WySx0fv9uQI/AAAAAAAABKM/r07bEGg6TiYnSffYFiujar2-0TIFJNA2gCLcBGAs/s400/www.png" },
        { name: "Hand Bag", price: 1250.0, description: "Cotton Woven", imageURL: "http://www.pngall.com/wp-content/uploads/2016/04/Women-Bag-PNG-HD.png" },
        { name: "Water Bottle", price: 500.0, description: "Glass, Shatter proof", imageURL: "https://www.amara.com/static/uploads/images-2/products/huge/171605/insulated-water-bottle-orange-large-410012.jpg" },
        { name: "iPhone Cover", price: 500.0, description: "For iPhone 6s", imageURL: "https://cdnblob.moshi.com/uploadedfiles/photo/v3/productImages/709/01.jpg" },
    ]

    res.send(items);
});

app.post('/items/', (req, res, next) => {
	console.log(req);
	res.send()
})

app.post('/user/login', (req, res, next) => {
    var userSent = req.body;
    var userHere = users[userSent.email]
    console.log(userSent);
    if (userHere!= undefined) {
        if (userHere.password == userSent.password) {
            res.send({success: "true"});
        }
    }
    res.send({success: "true"});
})

app.post('/user/register', (req, res, next) => {
    var user = req.body;
    users[user.email] = users[user.password]
    res.send()
})


app.listen(3000, () => {
    console.log('iOS App\'s backend is running!');
});
