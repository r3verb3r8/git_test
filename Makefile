REPO=github.com/ukajohn/git_test/
IMAGE=git_test
file := version.txt
version := $(shell cat ${file})
TAG="v${version}"
major := $(shell echo ${version} | cut -d. -f1)
minor := $(shell echo ${version} | cut -d. -f2)
patch := $(shell echo ${version} | cut -d. -f3)
next_major := $(shell expr ${major} + 1)
next_minor := $(shell expr ${minor} + 1)
next_patch := $(shell expr ${patch} + 1)
new := $(shell cat ${file})

local_build:
	docker build -t "${REPO}${IMAGE}:${TAG}" -t "${REPO}${IMAGE}:latest" .

run: 
	docker run "${REPO}${IMAGE}:${TAG}"

publish: publish-patch

test: patch
	$(eval $@_newversion := $(shell cat ${file}))
	echo $($@_newversion)
	echo "v$($@_newversion)"
	echo "${version}"

publish-patch: patch
	$(eval $@_newversion := $(shell cat ${file}))
	git add .
	git commit -m "Update to version $($@_newversion)"
	git tag -a "v$($@_newversion)" -m "Version $($@_newversion)"
	git push origin main "v$($@_newversion)"

publish-minor: minor
	$(eval $@_newversion := $(shell cat ${file}))
	git add .
	git commit -m "Update to version $($@_newversion)"
	git tag -a "v$($@_newversion)" -m "Version $($@_newversion)"
	git push origin main "v$($@_newversion)"

publish-major: major
	$(eval $@_newversion := $(shell cat ${file}))
	git add .
	git commit -m "Update to version $($@_newversion)"
	git tag -a "v$($@_newversion)" -m "Version $($@_newversion)"
	git push origin main "v$($@_newversion)"

patch:
	echo -n "${major}.${minor}.${next_patch}" > ${file}

minor:
	echo -n "${major}.${next_minor}.0" > ${file}

major:
	echo -n "${next_major}.0.0" > ${file}




# Don't echo command
$(V).SILENT: