
# Error found : 
Error: ImagePullBackOff and Error: ErrImagePull errors with GKE

This happen usually when your cluster:

- has private nodes (aka no Public IP's)
- There is no Cloud NAT for the region of that cluster
- You don't have Private Access enabled on the subnet/vpc
Basically the error is that the node is not able to pull the image from the registry. You might have two cases:

- If your images are hosted in GCR or AR (Google Container Registry or Artifact Registry). Even if your nodes are private, Google Private Access must be enabled to allow the node to reach the registry
- If your images are hosted on an external registry (Exp: Docker). You have to have either nodes with a public IP or Cloud NAT to reach the internet
- The third case would be if you have self-hosted registries onPrem or on an other Cloud. You need some sort of private connection between GCP and where the registry is hosted (VPN, Interconnect...) and you need to configure Cloud DNS to resolve the registry to the private IP