Swiss QR bill 2 human
=====================

Formats the contents of an image containing a Swiss QR bill code into human
readable output.

Requirements (package names in Debian/Ubuntu):
- gawk
- zbar-tools

Usage:
```
$ ./swiss-qr-code-2-human.sh
Usage: ./swiss-qr-code-2-human.sh <path-to-image-containing-qr-code>
```

Technical References
--------------------
https://www.paymentstandards.ch/dam/downloads/ig-qr-bill-de.pdf

From page 23 on, the above document describes the Swiss QR Code format.

In a nutshell, the QR code contains UTF-8 plain text, CR+LF terminated lines.
It contains various sections on fixed line positions, so upon looking up what
the contents represent, they become more or less human readable. This awk
script simply prepends the varios section with human readable designations.
This should let you easily copy paste the output.

For testing the script, try the following sample Swiss QR Bills:
https://www.paymentstandards.ch/dam/downloads/muster-qr-zahlteile-de.zip

If you just need to view the contents of a QR code, without installing any
software, you can use this online QR bill code validation tool:
https://www.swiss-qr-invoice.org/validator/

Further information, including the above documents, can be found at:
https://www.paymentstandards.ch/de/home/software-partner.html
