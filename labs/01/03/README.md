# Question:

Create a pod called `time-check` in the `dvl1987` namespace. This pod should run a container called `time-check` that uses the `busybox` image.

1. Create a config map called `time-config` with the data `TIME_FREQ=10` in the same namespace.
1. The time-check container should run the command: `while true; do date; sleep $TIME_FREQ;done` and write the result to the location `/opt/time/time-check.log`.
1. The path `/opt/time` on the pod should mount a volume that lasts the `lifetime of this pod`.
