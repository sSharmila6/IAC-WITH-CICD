# Cloud Nat
-	**Cloud NAT: Cloud Network Address Translation.
-	**Basically, NAT allows a single device, such as a router, to act as an agent between the Internet (or public network) and a local network (or private network), which means that only a single unique IP address is required to represent an entire group of computers to anything outside their network.
-	**VM instances Without external IP address and send outbound packet to internet and received corresponding established inbound response packet.
-	**Cloud NAT is a distributed, software-defined managed service.
-	**It’s not based on proxy VMs or appliances.
-	**Improved security, only outbound connections to the internet.

## Benefits of Cloud NAT Gateway:  
-	**Security: This reduce the need of external IP address to VM subject to egress firewall rules. VMs without external IP address can access destinations on the internet.
-	**Availability: Cloud NAT is a distributed, software-defined managed service.  It doesn’t depend on any VMs in your project or a single physical gateway device.
-	**Scalability: Cloud NAT can be configured to automatically scale the number of NAT IP addresses that it uses, and it supports VMs that belong to managed instance group including those with autoscaling enabled.
-	**Performance: Cloud NAT does not reduce the network bandwidth per VM.
