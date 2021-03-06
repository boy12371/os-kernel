# Build kernel release archives for use in building SveilOS

To build the tgz's and the kernel header & extras images, run:

```
git tag v4.14.228-sveil
KERNEL_TAG=4.14.228 make release
```

You should build it on an arm64 host if you want to get an arm64 kernel.

and if you're uploading them, set your GITHUB_TOKEN and login to docker hub, then run

(this requires https://github.com/aktau/github-release to be installed in your path)

```
# set go PATH
export PATH=$PATH:$HOME/go/bin
# set your token
export GITHUB_TOKEN=...
dist/publish.sh
```

## packaging your own kernel builds

Assuming you have some kernel source you have built in `/usr/src/linux-4.8`, you can
package up the result by running 

```
./scripts/package-kernel --srcdir /usr/src/linux-4.8
```

You may need to adjust the expected module list files.