FROM osmolabs/osmosis:27.0.0-alpine

RUN apk add dasel

WORKDIR /osmosis

ADD --chmod=755 ./setup.sh /osmosis/setup.sh

ENTRYPOINT [ "/osmosis/setup.sh" ]
