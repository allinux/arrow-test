# arrow-test

## vcpkg_version=2023.08.09

```
aws-sdk-cpp:x64-linux                             1.11.132
arrow:x64-linux                                   12.0.1
```


1. docker build --file ubuntu-22.04-cpp-minimal.dockerfile . -t allinux-arrow-leak-check:v1
2. docker run -d --privileged --name allinux-arrow-leak-check allinux-arrow-leak-check:v1
3. docker exec -it yhjung-ubuntu-22.04-arrow bash

```
root@c213dacb3212:/# cd code/build/
root@c213dacb3212:/code/build# valgrind ./arrow_exam01 
==83== Memcheck, a memory error detector
==83== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==83== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==83== Command: ./arrow_exam01
==83== 
==83== 
==83== HEAP SUMMARY:
==83==     in use at exit: 39,827 bytes in 278 blocks
==83==   total heap usage: 47,759 allocs, 47,481 frees, 4,238,024 bytes allocated
==83== 
==83== LEAK SUMMARY:
==83==    definitely lost: 224 bytes in 1 blocks
==83==    indirectly lost: 0 bytes in 0 blocks
==83==      possibly lost: 608 bytes in 2 blocks
==83==    still reachable: 38,995 bytes in 275 blocks
==83==         suppressed: 0 bytes in 0 blocks
==83== Rerun with --leak-check=full to see details of leaked memory
==83== 
==83== For lists of detected and suppressed errors, rerun with: -s
==83== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
root@c213dacb3212:/code/build# 
```
