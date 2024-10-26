To check the SSL certificate of a website from a Linux box, you can use `OpenSSL`. Here's a command that will help you view the certificate details directly from the command line.

### Using OpenSSL
1. **Check Certificate Details**:
   ```bash
   echo | openssl s_client -connect example.com:443 -servername example.com 2>/dev/null | openssl x509 -noout -text
   ```
   - **Replace** `example.com` with the domain name of the website you want to check.
   - This command connects to the site, retrieves the certificate, and displays it in a readable format.

2. **Check Certificate Expiration**:
   ```bash
   echo | openssl s_client -connect example.com:443 -servername example.com 2>/dev/null | openssl x509 -noout -dates
   ```
   - This will show only the **start** and **end dates** of the certificate validity.

### Explanation
- `s_client -connect example.com:443`: Connects to the server over HTTPS (port 443).
- `-servername example.com`: Required for SNI (Server Name Indication), useful for sites hosted on shared IPs.
- `openssl x509 -noout -text`: Outputs the certificate details.
- `-dates`: Displays only the start and end dates of the certificate.

This approach is great for quick certificate checks right from the Linux terminal.