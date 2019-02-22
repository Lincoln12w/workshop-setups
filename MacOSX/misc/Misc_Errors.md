
# git clone failed

```sh
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (4/4), done.
error: RPC failed; curl 18 transfer closed with outstanding read data remaining
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
```

Due to a large tag file for very big repo.

```sh
git clone /github_com/large-repository --depth 1
cd large-repository
git fetch --unshallow
```

or

```sh
git config –global http.postBuffer 524288000 # (size of the buffer, here is 500MB)
```
