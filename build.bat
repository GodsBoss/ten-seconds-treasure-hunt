@ECHO OFF

coffee -j game.coffee -c src/Resizer.coffee src/CanvasResizeListener.coffee src/Loop.coffee src/InteractionQueue.coffee src/init.coffee
