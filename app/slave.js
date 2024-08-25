importScripts(
     'https://storage.googleapis.com/workbox-cdn/releases/7.1.0/workbox-sw.js'
);

workbox.routing.registerRoute(
     ({request}) => request.destination === 'document',
     new workbox.strategies.StaleWhileRevalidate()
);

workbox.routing.registerRoute(
     ({request}) => request.destination === 'style',
     new workbox.strategies.StaleWhileRevalidate()
);

workbox.routing.registerRoute(
     ({request}) => request.destination === 'script',
     new workbox.strategies.StaleWhileRevalidate()
);

workbox.routing.registerRoute(
     ({request}) => request.destination === 'json',
     new workbox.strategies.StaleWhileRevalidate()
);

workbox.routing.registerRoute(
     ({request}) => request.destination === 'image',
     new workbox.strategies.StaleWhileRevalidate()
);
