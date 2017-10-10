# honggfuzz_bind
docker environment for fuzzing bind with honggfuzz

## Run

```
docker run -d --name bind -v $(pwd)/crash:/work/crash skysider/honggfuzz_bind
docker exec -it bind /bin/bash
root@9ed0fafe5cb2# honggfuzz -s -f honggfuzz/examples/bind/IN.req-response/ \
-p "`pidof named`" -S -- /bin/nc -q2 -w2 127.0.0.1 53
```
## Reference

- https://github.com/google/honggfuzz/tree/master/examples/bind
- https://github.com/google/honggfuzz/blob/master/docs/AttachingToPid.md