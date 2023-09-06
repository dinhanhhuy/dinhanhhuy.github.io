# Todo SSL
```bash
➜  cloud-blog git:(main) certbot certonly --standalone -v
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator standalone, Installer None
Please enter the domain name(s) you would like on your certificate (comma and/or
space separated) (Enter 'c' to cancel): whiteballs.tech
Requesting a certificate for whiteballs.tech

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/whiteballs.tech/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/whiteballs.tech/privkey.pem
This certificate expires on 2023-10-19.
These files will be updated when the certificate renews.

NEXT STEPS:
- The certificate will need to be renewed before it expires. Certbot can automatically renew the certificate in the background, but you may need to take steps to enable that functionality. See https://certbot.org/renewal-setup for instructions.
Subscribe to the EFF mailing list (email: dinhanhhuy.it@gmail.com).

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```