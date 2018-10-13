
### This code has some tweaking from original code to make it work on IBM POWER and support GPU

## Quick start with Docker
```
clone the repo
cd videortc
docker build . -t videortc
docker run -it -p 5000:5000 videortc
```





## Example web apps

Point your browser to:
-  `https://localhost:5000/local` - shows a mirrored video from a webcam and starts object detection

## Browser support

WebRTC browsers have secure origin restrictions: 
- Chrome will only work on `localhost` unless you add TLS certificates to your server
- Firefox will work on any domain as long as you allow it
- Safari will work, but you will need to "Allow Media Capture on Insecure Domains" 




