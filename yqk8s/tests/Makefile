.PHONY: all
all: fluxcd victorialogs loki

.PHONY: fluxcd
fluxcd:
	./bin/examine-flux-operator.sh | ../yqk8s

.PHONY: victorialogs
victorialogs:
	./bin/examine-victorialogs.sh | ../yqk8s

.PHONY: loki
loki:
	./bin/examine-loki.sh | ../yqk8s
