EC2 Instance Endpoint Connect with Internet Access
Hey Cloud & DevOps Enthusiasts,
I am back with another blog in the series of DevOps. In this blog, we will learn how to create an EC2 instance with an endpoint and internet access using Terraform.
### Why so special about this blog?
I have gone through many blogs and videos on the internet to create and connect to an EC2 instance with an endpoint and internet access. However, I didn't find any blog or video that explains the complete process. So I decided to create a blog that explains the complete process of creating an EC2 instance with an endpoint and internet access.
The blogs that I went through either leveraged the public IP or connected using an endpoint that will provide the internet using the public IP. A few other blogs just created the EC2 instance with an endpoint but didn't provide internet access.
In this blog, we will create an EC2 instance with an endpoint and internet access. We will not use the public IP address to connect to the EC2 instance. We will connect to the EC2 instance using the endpoint.
TLDR;
I created a public subnet and a private subnet. I created an EC2 instance in the private subnet. I created an endpoint to connect to the EC2 instance. I created an internet gateway and a route table to access the internet from the public subnet. I also created a NAT gateway and a route table to access the internet from the private subnet.
![](https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint/blob/main/images/aws_endpoint.png?raw=true)
Before we start, let's understand what is an EC2 instance connect endpoint and why we need it.
### What is an EC2 instance connection endpoint?
EC2 Instance Connect Endpoint allows you to connect to an instance without requiring the instance to have a public IPv4 address. You can connect to any instances that support TCP.
### Why the EC2 instance connection endpoint?
EC2 Instance Connect provides a simple and secure way to connect to your instances using Secure Shell (SSH). With EC2 Instance Connect, you use AWS Identity and Access Management (IAM) policies and principals, and SSH keys to control access to your instances. EC2 Instance Connect eliminates the need to use bastion hosts, SSH keys, and passwords, or to manually manage authorized users through IAM. EC2 Instance Connect uses AWS CloudTrail to audit all connections made to your instances, recording the instance user, IP address, date, time, and whether the attempt was successful or not.
### Traditional way of accessing EC2 instance in the private subnet
In the traditional way, we need to create a bastion host in the public subnet and then we can access the EC2 instance in the private subnet using the bastion host.
Traditionally, users faced the cumbersome task of connecting to their resources through a bastion host with a public IP address, set up via an Internet Gateway (IGW) within their Virtual Private Cloud (VPC). This process often involved port forwarding to reach the intended destination. However, with the introduction of the EC2 Instance Connect (EIC) Endpoint, this convoluted approach is rendered obsolete.
Users can now bypass the need for an IGW in their VPC, eliminate the requirement for a public IP address on their resources, and bid farewell to the intricacies of managing a bastion host or any additional agents. The EIC Endpoint streamlines the connection process, providing a more direct and secure method for users to access their resources. This not only simplifies the user experience but also enhances security by reducing the attack surface associated with maintaining public-facing infrastructure.
Moreover, the service facilitates detailed auditing and logging of connection requests, providing administrators with a comprehensive overview of who is accessing resources and when. This feature is invaluable for security and compliance monitoring, enabling a proactive approach to managing and mitigating potential security risks.
In summary, the EIC Endpoint not only simplifies and secures the process of connecting to resources but also aligns with best practices in cloud security, allowing users to enjoy a more streamlined and efficient workflow without compromising on safety and control.
### About the Infrastructure we are going to create
We will create a VPC with 2 subnets, one public and one private. We will create an EC2 instance in the private subnet and an endpoint to access the EC2 instance. We will also create an internet gateway and a route table to access the internet from the public subnet. we also created a nat gateway and a route table to access the internet from the private subnet.
The infrastructure is scripted in Terraform. You can find the code in the GitHub repository.
### Let's deploy the infrastructure
Clone the GitHub repository using the following command.
```bash
git clone https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint.git
```
Go to the directory ec2-instance-connect-endpoint.
```bash
cd ec2-instance-connect-endpoint
```
We are leveraging the AWS us-west-2 region. You can change the region as per your requirement. If you want to change the region, you need to change the AMI ID in the variables.tf file.
Initialize the Terraform.
```bash
terraform init
```
This will download the required plugins for Terraform.
Now, let's create the infrastructure.
```bash
terraform apply -auto-approve
```
This will create the infrastructure. It will take 5–10 minutes to create the infrastructure.
Once the infrastructure is created, you will see the output below.
* Now login to the AWS console and change the region to us-west-2. Then go to the EC2 service and click on the Instances link. You will see the EC2 instance with the name "EC2-instance-connect-endpoint" is running.
![](https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint/blob/main/images/listed_ec2.png?raw=true)
* Now click on the "EC2-instance-connect-endpoint" instance and click on the "Connect" button. You will see the "EC2 Instance Connect" option and the "EC2 Instance Connect Endpoint" option. Click on the "EC2 Instance Connect" option.
![](https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint/blob/main/images/nopublic_ip.png?raw=true)
You can see that we don't have any public IP address for the EC2 instance.
* Now click on the "EC2 Instance Connect Endpoint" option. You will see the "Connect to your instance using EC2 Instance Connect" window. You will select the EC2 Instance CONNECT CLI option and click on the "Connect" button.
![](https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint/blob/main/images/before_connect.png?raw=true)
* It will be connected to the EC2 instance.
![](https://github.com/rajeshdevopsaws/ec2-instance-connect-endpoint/blob/main/images/connected.png?raw=true)
You can see that we are connected to the EC2 instance without using the public IP address. Also, we are able to access the internet from the EC2 instance.
### References
- (EC2 Instance Connect)[https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-methods.html]
- (EC2 Instance Connect Endpoint)[https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-endpoints.html]
- (EC2 Instance Connect CLI)[https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-set-up.html#ec2-instance-connect-connecting-ec2-cli]

### How can you connect with me?
You can connect with me on Linkedin Rajesh Kanumuru(https://www.linkedin.com/in/rajesh-kanumuru-1a0088141/)
You can connect with me on X(Twitter) Rajesh Kanumuru(https://twitter.com/kanumururajesh) 

