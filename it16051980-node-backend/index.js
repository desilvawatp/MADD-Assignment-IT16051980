var express = require('express');
var app = express();

app.get('/items/all', (req, res, next) => {
    var items = [
        { name: "Hair Dryer", price: 8500.0, description: "Philips Hair Dryer", imageURL: "https://3.bp.blogspot.com/-VsT-CRJvpXI/WySx0fv9uQI/AAAAAAAABKM/r07bEGg6TiYnSffYFiujar2-0TIFJNA2gCLcBGAs/s400/www.png" },
        { name: "Hand Bag", price: 1250.0, description: "Cotton Woven", imageURL: "http://www.pngall.com/wp-content/uploads/2016/04/Women-Bag-PNG-HD.png" },
        { name: "Water Bottle", price: 500.0, description: "Glass, Shatter proof", imageURL: "https://www.amara.com/static/uploads/images-2/products/huge/171605/insulated-water-bottle-orange-large-410012.jpg" },
        { name: "iPhone Cover", price: 500.0, description: "For iPhone 6s", imageURL: "https://cdnblob.moshi.com/uploadedfiles/photo/v3/productImages/709/01.jpg" },
    ]

    res.send(items);
});

app.listen(3000, () => {
    console.log('iOS App\'s backend is running!');
});