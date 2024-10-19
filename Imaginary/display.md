To dynamically load all images from a folder, you would typically need a server-side script to list the files in the directory. However, since HTML and JavaScript alone cannot access the file system directly, you would need to use a server-side language like Python, PHP, or Node.js to achieve this.

Here's an example using Node.js with Express to serve the images:

1. **Set up a Node.js server:**

    Create a file called `server.js`:

    ```javascript
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
    ```

2. **Modify your HTML to fetch and display the images:**

    Update your `display.html`:

    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Image Carousel</title>
         <style>
              .carousel {
                    position: relative;
                    width: 80%;
                    margin: auto;
                    overflow: hidden;
              }
              .carousel img {
                    width: 100%;
                    display: none;
              }
              .carousel img.active {
                    display: block;
              }
              .carousel-header {
                    text-align: center;
                    font-size: 1.5em;
                    margin-bottom: 10px;
              }
              .carousel-controls {
                    text-align: center;
                    margin-top: 10px;
              }
              .carousel-controls button {
                    padding: 10px;
                    font-size: 1em;
              }
         </style>
    </head>
    <body>
         <div class="carousel">
              <div class="carousel-header" id="carousel-header">Loading...</div>
              <div id="carousel-images"></div>
              <div class="carousel-controls">
                    <button onclick="prevImage()">Previous</button>
                    <button onclick="nextImage()">Next</button>
              </div>
         </div>

         <script>
              let currentIndex = 0;
              let images = [];
              const header = document.getElementById('carousel-header');
              const carouselImages = document.getElementById('carousel-images');

              function showImage(index) {
                    images.forEach((img, i) => {
                         img.classList.toggle('active', i === index);
                    });
                    header.textContent = images[index].alt;
              }

              function prevImage() {
                    currentIndex = (currentIndex > 0) ? currentIndex - 1 : images.length - 1;
                    showImage(currentIndex);
              }

              function nextImage() {
                    currentIndex = (currentIndex < images.length - 1) ? currentIndex + 1 : 0;
                    showImage(currentIndex);
              }

              fetch('/images')
                    .then(response => response.json())
                    .then(data => {
                         data.forEach((file, index) => {
                              const img = document.createElement('img');
                              img.src = file;
                              img.alt = `Image ${index + 1}`;
                              if (index === 0) img.classList.add('active');
                              carouselImages.appendChild(img);
                              images.push(img);
                         });
                         header.textContent = images[0].alt;
                    })
                    .catch(error => {
                         console.error('Error fetching images:', error);
                         header.textContent = 'Error loading images';
                    });
         </script>
    </body>
    </html>
    ```

3. **Place your images in the `images` folder** in the same directory as `server.js`.

4. **Run your Node.js server:**

    ```bash
    node server.js
    ```

5. **Open your browser** and navigate to `http://localhost:3000/display.html`.

This setup will dynamically load all images from the `images` folder and display them in the carousel.