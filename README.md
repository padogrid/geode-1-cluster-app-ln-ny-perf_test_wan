# Bundle: WAN

The `wan` bundle includes two (2) local clusters configured with bi-directional WAN gateways. You can test the bundle immediately after installation. No configurations required.

To understand how the clusters are configured, please see the following WAN example. It provides step-by-step instructions for creating and running WAN enabled clusters from scratch.

[https://github.com/javapark1/geode-addon/blob/master/doc/WAN-Example.md](https://github.com/javapark1/geode-addon/blob/master/doc/WAN-Example.md)

## Installing Bundle

```console
install_bundle -download geode-1-cluster-app-ln-ny-perf_test_wan
```

## Use Case

In this use case, two (2) local clusters are configured to replicate select  Geode/GemFire regions across the WAN. With the included `perf_test_wan` app you can ingest data into the `ny` cluster and monitor the WAN replication taking place into the `ln` cluster using Geode/GemFire Pulse in the browser.

![WAN Diagram](/images/wan-ny-ln.png)

## Running Clusters

Add a locator and two members to both clusters.

```console
# ny
switch_cluster ny
add_locator
add_member
add_member

# ln
switch_cluster ln
add_locator
add_member
add_member
```

Run the clusters.

```console
start_cluster -cluster ny
start_cluster -cluster ln
```

## Monitoring Clusters

The clusters can be monitored in a number of ways, i.e., by Pulse, gfsh, VSD, JMX, Grafana, geode-addon, etc. Let's use Pulse for our example. You can view the gateway sender activities from Pulse. To get the Pulse URLs for both clusters run the following:

```console
show_cluster -long -cluster ny
show_cluster -long -cluster ln
```

You should see the following URLs from the command outputs.

- ny: [http://localhost:7070/pulse](http://localhost:7070/pulse)
- ln: [http://localhost:7080/pulse](http://localhost:7080/pulse)

## Running `perf_test_wan`

The included `perf_test_wan` app is the same `perf_test` app that you can also create by running the `create_app` command. There are no configuration differences between the two. Either one will properly populate data into both clusters.

The `perf_test_wan` app connects to the `ny` cluster so the `ny` cluster is the sender and `ln` is the receiver.

Change directory into the `perf_test_wan`'s `bin_sh` directory.

```console
cd_app perf_test_wan; cd bin_sh
```

First, ingest data into the `eligibility` and `profile` regions. 

```console
./test_ingestion -run
```

Next, generate transactional data into the `summary` region which is configured to replicate between the clusters.

```console
./test_tx -run
```

## Replicating from `ln` to `ny`

If you want to send from the `ln` cluster to the `ny` cluster then change the locator port in the `client-cache.xml` file.

```console
cd_app perf_test_wan
vi etc/client-cache.xml
```

Change the locator port number from 10333 (ny) to 10344 (ln).

```xml
<pool name="serverPool">
   <locator host="localhost" port="10344" />
</pool>
```

Run `test_tx` as before.

```console
cd bin_sh
./test_tx -run
```

## Tearing Down

```console
stop_cluster -all -cluster ny
stop_cluster -all -cluster ln
```
