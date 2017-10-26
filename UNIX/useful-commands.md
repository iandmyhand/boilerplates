# counting files of directories.
  ```
  for i in /*; do echo $i; find $i |wc -l; done
  ```

# finding biggest directory in given path.
  ```
  du --max-depth=7 /* | sort -n
  ```
