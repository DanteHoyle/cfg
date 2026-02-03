if command -v go &> /dev/null; then
    addtopath "$(go env GOPATH)/bin" > /dev/null
fi
