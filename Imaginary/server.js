    const express = require('express');
    const fs = require('fs');
    const path = require('path');

    const app = express();
    const imagesDir = path.join(__dirname, 'images');

    app.use(express.static(imagesDir));

    app.get('/images', (req, res) => {
         fs.readdir(imagesDir, (err, files) => {
              if (err) {
                    return res.status(500).send('Unable to scan directory');
              }
              const imageFiles = files.filter(file => /\.(jpg|jpeg|png|gif)$/.test(file));
              res.json(imageFiles);
         });
    });

    app.listen(3000, () => {
         console.log('Server is running on http://localhost:3000');
    });