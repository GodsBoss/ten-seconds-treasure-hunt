FROM godsboss/coffeescript:2.3.1 AS jsbuilder

WORKDIR /root
COPY src/ /root/

RUN cat \
  Resizer.coffee\
  CanvasResizeListener.coffee\
  Loop.coffee\
  InteractionQueue.coffee\
  Game.coffee\
  GameRenderer.coffee\
  Graphics.coffee\
  SpritesData.coffee\
  SpriteSheet.coffee\
  Level.coffee\
  LevelsData.coffee\
  LevelReader.coffee\
  Tile.coffee\
  LevelScreen.coffee\
  Player.coffee\
  Item.coffee\
  Obstacle.coffee\
  Treasure.coffee\
  Whirlpool.coffee\
  Ship.coffee\
  TextRenderer.coffee\
  init.coffee\
  > game.coffee
RUN coffee -c game.coffee

FROM godsboss/gimp:2.8.22 AS gfxbuilder
WORKDIR /root
COPY gfx.sh /root
COPY export.scm /root
COPY gfx.xcf /root
RUN /root/gfx.sh

FROM nginx:1.15.2-alpine
COPY index.html /usr/share/nginx/html/
COPY --from=jsbuilder /root/game.js /usr/share/nginx/html/
COPY --from=gfxbuilder /root/gfx.png /usr/share/nginx/html/
