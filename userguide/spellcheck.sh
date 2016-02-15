pushd ./doc/src
for f in *.ltx
do
    aspell -c -t $f
done
popd
