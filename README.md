# CIS Kubernetes Benchmark

![CIS Kubernetes Benchmark output](https://raw.githubusercontent.com/neuvector/kubernetes-cis-benchmark/master/bench.png "CIS Kubernetes Benchmark output")

This set of scripts can be used to check the Kubernetes installation against the best-practices. They are inspired by CIS Kubernetes 1.6 Benchmark.

These scripts are devided into the set to run on the Kubernetes master nodes, worker nodes and federation nodes.

On the master nodes,
```
$ ./master.sh
```

On the worker nodes,
```
$ ./worker.sh
```
On the federation nodes,
```
$ ./federation.sh
