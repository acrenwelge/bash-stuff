# Setting up a pipeline
The goal is to set up a pipeline with Jenkins as quickly and painlessly as possible.
In order to accomplish this, many steps have been automated with scripts.
This particular setup will be deploying a Spring framework project that is not using Spring boot.
This makes the process more complicated, so it would be even easier with Spring boot.

## Create an EC2 instance
Create a new Amazon Linux AMI 2 instance with either an existing key pair, or a new one.
Further configuration is not needed, but you may add tags if you wish.
20 GB volume size is preferable, but can go up to 30 GB within the free tier.

IMPORTANT: There are 3 ip-addresses that need to be added to the security group. This will allow Github to send data through webhooks.

Add the following ip's to port 8080 (where jenkins will be running), then webhooks will be allowed

    192.30.252.0/22
    185.199.108.0/22
    140.82.112.0/20


## (Optional, Recommended) Configure an ssh Host
On the local computer, there should be a .ssh folder in the home directory (~) with a file named 'config'.
If it exists, edit it, otherwise create them.
Set the comments simlarly to the example config file, making sure that the IdentityFile points to the correct location of the pem file from the key pair that was used to create the EC2 instance.
The Host can be anything you want, pipeline is used here.
It is recommended to store the key pairs in this folder as well, to make configuring these hosts simpler. This demo uses a keys folder.
Note: This name also works for `scp` to make copying files much more convenient.



## Get pipeline setup
Open `git bash` or some other terminal in this folder

`scp *.sh pipeline:~` # Copy script files over, except for the config and the README
  type yes
`ssh pipeline`

`sudo yum update -y` # Update packages that can be
(Optional) `sh swapspace.sh` # Create swapspace
`sh ec2-jenkins-setup.sh` # Install needed packages
`sudo sh set-env.sh` # Create script that creates/refreshes environment variables
`source /etc/profile.d/tomcat.sh` # Actually execute the script that was just created
`sudo sh permissions.sh` # Change folder permissions for Jenkins to access tomcat

At this point jenkins should be available at port 8080
`sudo vi /var/lib/jenkins/secrets/initialAdminPassword`
  copy down the password

Navigate to the EC2's public ip or dns on port 8080 and login with that password

Choose Install Suggested plugins, no other plugins needed

Can opt to skip creating another user and to just login as admin
  username: admin
  password: what you just copied



## Create Github Repo

Create a Github repository that is public
It should have a maven project that is packaged as a war
  Make sure that the root level of the repository has the pom.xml

IMPORTANT: This version of tomcat will set the context path to be the name of the war file
This means that if the war file is called application-0.0.1-SNAPSHOT.war, and you have a mapping to /hello, the actual url will be /application-0.0.1-SNAPSHOT/hello
There is a configuration in the pom.xml to define the resulting name of the war file, it looks like this

    <build>
      <finalName>FileName</finalName>
    </build>

## Configure webhook
On that repo, go to Settings > Webhooks

Add a webhook

The payload url is ec2-public-ip-or-dns:8080/github-webhook/

The content type can be whatever option you want

The rest of the settings can be left alone



## Create Jenkins Job
Create a new item
Choose a freestyle project
Under the Source Code Management section select Git & enter the repository url
  this is the same as what you would enter in order to clone the repo
  Ex: https://github.com/GitHubUsername/repo-name.git

Under Build Triggers: Tick the option for `GitHub hook trigger for GITScm Polling`

As a build step, choose execute shell
Copy the contents from deploy.sh, modify if necessary

Apply and Save
