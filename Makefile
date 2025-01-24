
.PHONY: host-wasm
host-wasm:
	flutter build web --wasm
	firebase deploy --only hosting:wasm

.PHONY: host-html
host-html:
	flutter build web --web-renderer html
	firebase deploy --only hosting:html

.PHONY: host-canvaskit
host-canvaskit:
	flutter build web --web-renderer canvaskit
	firebase deploy --only hosting:canvaskit

.PHONY: clean
clean:
	flutter clean
	flutter pub get