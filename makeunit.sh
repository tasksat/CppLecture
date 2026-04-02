#!/bin/sh

make_unit() {
  num=$1
  unit="Unit$num"
  if [ ! -d "src/$unit" ]; then
    mkdir -p "src/$unit"
  fi
  file="src/$unit/main.cpp"
  if [ ! -e "$file" ]; then
    touch "$file"
  fi
}

if [ "$#" -eq 1 ]; then
  make_unit "$1"
elif [ "$#" -eq 2 ]; then
  for i in $(seq "$1" "$2"); do
    make_unit "$i"
  done
else
  cat >&2 <<EOF
Usage: $0 <N>        : creates Unit<N>
       $0 <L> <R>    : creates Unit<L> ... Unit<R>
EOF
  exit 1
fi