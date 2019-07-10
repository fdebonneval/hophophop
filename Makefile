IMAGE = fouxm/hophophop:latest
VPN_TARGET ?= US-East
TRACE_TARGET ?= 1.1.1.1
START_SHELL ?=

RUN_OPTIONS = --cap-add=NET_ADMIN
RUN_OPTIONS += --name US-East
RUN_OPTIONS += -e "VPN_TARGET=$(VPN_TARGET)"
RUN_OPTIONS += -e "TRACE_TARGET=$(TRACE_TARGET)"
RUN_OPTIONS += -e "START_SHELL=$(START_SHELL)"
RUN_OPTIONS += --dns 9.9.9.9
RUN_OPTIONS += -v ${HOME}/Dropbox/Windscribe:/vpn

run:
	docker run --rm -it $(RUN_OPTIONS) $(IMAGE)
