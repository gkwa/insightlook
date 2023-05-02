SOURCES := $(shell find . -name '*.go')
TARGET := ./dist/insightlook_darwin_amd64_v1/insightlook

run: insightlook
	./insightlook

insightlook: $(TARGET)
	cp $< $@

$(TARGET): $(SOURCES)
	gofumpt -w $<
	goreleaser build --single-target --snapshot --clean

.PHONY: clean
clean:
	rm -f insightlook
	rm -f $(TARGET)
	rm -rf dist
