# honggfuzz_bind
docker environment for fuzzing bind with honggfuzz

## Run

```
docker run -it --name bind -v $(pwd)/crash:/work/crash skysider/honggfuzz_bind
root@9ed0fafe5cb2:/work# honggfuzz -f honggfuzz/examples/bind/IN.req-response/ -z -P -- \
./dist/sbin/named -c dist/etc/named.conf -g
```
## Reference

- https://github.com/google/honggfuzz/tree/master/examples/bind
- https://github.com/google/honggfuzz/blob/master/docs/AttachingToPid.md