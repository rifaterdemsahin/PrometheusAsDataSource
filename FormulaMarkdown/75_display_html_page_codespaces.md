# Displaying a Webpage in GitHub Codespaces

To display a webpage in GitHub Codespaces, follow these steps:

1. **Create an HTML File**:
    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Webpage</title>
    </head>
    <body>
        <h1>Hello, Codespaces!</h1>
    </body>
    </html>
    ```

2. **Start a Simple HTTP Server**:
    - If you have Python installed, you can use the following command to start a simple HTTP server:
        ```sh
        python3 -m http.server 8080
        ```
    - Alternatively, you can use Node.js:
        ```sh
        npx http-server -p 8080
        ```

3. **Forward the Port**:
    - In GitHub Codespaces, go to the `Ports` tab.
    - Find the port `8080` and click on `Make Public`.

4. **Access the Webpage**:
    - Click on the URL provided in the `Ports` tab to open your webpage in a new browser tab.

That's it! You should now see your webpage displayed.
