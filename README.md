# CIS Kubernetes Benchmark

![CIS Kubernetes Benchmark output](https://raw.githubusercontent.com/neuvector/kubernetes-cis-benchmark/master/bench.png "CIS Kubernetes Benchmark output")

This set of scripts can be used to check the Kubernetes installation against the best-practices. CIS Kubernetes Benchmark 1.6 and 1.8 are implemented.

These scripts are devided into the set to run on the Kubernetes master nodes, worker nodes and federation nodes.

For the Kubernetes version 1.8, you can use CIS Kubernetes Benchmark 1.8. 

On the Kubernetes 1.8 master nodes,
```
$ ./master.sh 1.8
```

On the Kubernetes 1.8 worker nodes,
```
$ ./worker.sh 1.8
```

On the Kubernetes 1.8 federation nodes,
```
$ ./federation.sh 1.8 


For the Kubernetes version other than 1.8, you can use CIS Kubernetes Benchmark 1.6.

On the Kubernetes 1.6 master nodes,
```
$ ./master.sh 1.6
```

On the Kubernetes 1.6 worker nodes,
```
$ ./worker.sh 1.6
```

On the Kubernetes 1.6 federation nodes,
```
$ ./federation.sh 1.6 
