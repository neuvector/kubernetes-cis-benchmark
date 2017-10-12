# CIS Kubernetes Benchmark

![CIS Kubernetes Benchmark output](https://raw.githubusercontent.com/neuvector/kubernetes-cis-benchmark/master/bench.png "CIS Kubernetes Benchmark output")

This set of scripts can be used to check the Kubernetes installation against the best-practices. CIS Kubernetes Benchmark 1.6 and 1.8 are implemented.

These scripts are devided into the set to run on the Kubernetes master nodes, worker nodes and federation nodes.

For the Kubernetes version 1.8, you can use CIS Kubernetes Benchmark 1.8.

On the master nodes,
```
$ ./master_1_8.sh
```

On the worker nodes,
```
$ ./worker_1_8.sh
```

On the federation nodes,
```
$ ./federation_1_8.sh

For the Kubernetes version other than 1.8, you can use CIS Kubernetes Benchmark 1.6.

On the master nodes,
```
$ ./master_1_6.sh
```

On the worker nodes,
```
$ ./worker_1_6.sh
```

On the federation nodes,
```
$ ./federation_1_6.sh
