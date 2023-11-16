# EKS Secondary Cidr
## Notes
100.64.0.0/10 is not part of RFC 1918 or public CIDR. This is not routable through Direct connect, VPN or Transit gateway.
AWS EKS support this range as network [here](https://aws.amazon.com/about-aws/whats-new/2018/10/amazon-eks-now-supports-additional-vpc-cidr-blocks/)


Because of the [default SNAT configuration](https://docs.aws.amazon.com/eks/latest/userguide/external-snat.html), all outgoing traffic from pods operating within the cluster is routed through the specific EC2 node where these pods are deployed.

## Components
1. Secondary CIDR in existing EKS VPC
2. extra subnets in the secondary CIDR range
3. VPC CNI configuration updates
4. new CRDs - ENIConfig for each availability zones  

## deployments
```shell
terraform init
terraform plan
terraform apply
```
## Reference
- [CIDR support](https://aws.amazon.com/about-aws/whats-new/2018/10/amazon-eks-now-supports-additional-vpc-cidr-blocks/)
- multiple CIDR [docs](https://repost.aws/knowledge-center/eks-multiple-cidr-ranges)
- Custom networking for pods [docs](https://docs.aws.amazon.com/eks/latest/userguide/cni-custom-network.html)