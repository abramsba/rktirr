# rktirr

Racket API for using `libirr`. The C wrapper `libirr` needs to be compiled and installed seperately. 

This API will search in the following places for `libirr`:

* The current working directory `(current-directory)`
* The directory set by environment variable `LIBIRR_DIR`
* In folder `/usr/lib`

If the library can't be found the following error message will appear

```
error: no_libirr.so
 context...:
```
