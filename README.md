Docker for BOSH command line
==============

Background:
-------------
Installing BOSH command line (bosh_cli) takes time, this docker file helps you get started fast.

The environment is built using instruction of following:
[BOSH Bootstrap](http://docs.cloudfoundry.org/deploying/vsphere/deploying_micro_bosh.html)
[Setup Ruby environment](http://docs.cloudfoundry.org/deploying/common/install_ruby_rbenv.html)

Requirement:
-------------
This DockerFile has been tested with Ubuntu:14.04.
Please download ubuntu:14.04 using: <code>docker pull ubuntu:14.04</code> (Although it will automatically pull it when build).

How to build?
-------------
<code>git clone https://github.com/hinyinlam/docker-bosh-cli</code>
<code>docker build docker-bosh-cli</code>

How to use?
-------------
After build success, you will have an image id

<code>docker run --tty --interactive image_id</code>
At this point, you will see a new bash shell, you can then use bosh command line as usual:
<code>bosh</code>

Bug report
-------------
Please email to hlam at [pivotal.io](pivotal.io) if you found any bug/issue.
