'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/LICENSE": "3e0ac52485a92fe54638a54d3cfbaf63",
"/assets/FontManifest.json": "4ac8439bc1cd6a1cb7c67f8fd6e85bc7",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/fonts/Alata-Regular.ttf": "03a7f67c33c44897db76fa072725df8d",
"/assets/AssetManifest.json": "14f9ca605c4f3f86fbb377984b4f8152",
"/index.html": "4eb742a16c114a08c3a4eae0d8805fd5",
"/main.dart.js": "a6a464778459146bdf13eabde86f364e"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});