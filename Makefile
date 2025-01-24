
.PHONY: deploy-wasm
deploy-wasm:
	flutter build web --wasm
	firebase deploy --only hosting:wasm

.PHONY: deploy-html
deploy-html:
	flutter build web --web-renderer html
	firebase deploy --only hosting:html

.PHONY: deploy-canvaskit
deploy-canvaskit:
	flutter build web --web-renderer canvaskit
	firebase deploy --only hosting:canvaskit

.PHONY: clean
clean:
	flutter clean
	flutter pub get