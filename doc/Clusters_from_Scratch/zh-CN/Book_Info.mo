��          �      �       0  :   1     l  6   �  <   �  7   �  6   .  �   e  	   5  )   ?  A   i     �  �   �    �  6   �     �  2   �  +     ,   D  3   q    �  	   �     �  (   �  "     �   2     	                
                                     &DISTRO; &amp;DISTRO_VERSION; as the host operating system Clusters from Scratch Corosync to provide messaging and membership services, Creating Active/Passive and Active/Active Clusters on Fedora DRBD as a cost-effective alternative to shared storage, GFS2 as the cluster filesystem (in active/active mode) Given the graphical nature of the Fedora install process, a number of screenshots are included. However the guide is primarily composed of commands, the reasons for executing them and their expected outputs. Pacemaker Pacemaker to perform resource management, The crm shell for displaying the configuration and making changes The example cluster will use: The purpose of this document is to provide a start-to-finish guide to building an example active/passive cluster with Pacemaker and show how it can be converted to an active/active one. Project-Id-Version: 0
POT-Creation-Date: 2010-12-15T23:32:36
PO-Revision-Date: 2010-12-15 23:35+0800
Last-Translator: Charlie Chen <laneovcc@gmail.com>
Language-Team: None
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 &DISTRO; &amp;DISTRO_VERSION; 作为基本操作系统 从头开始搭建集群 Corosync作为通信层和提供关系管理服务 在Fedora上面创建主/主和主备集群 DRBD 作为一个经济的共享存储方案 GFS2 作为集群文件系统（主/主模式中） 虽然给出了图形化安装Fedora的过程，并且有很多截图，但是本文的主要是靠命令来操作，包括为什么要运行这个命令和这些操作产生的结果。(译者注:本文中基本是crm shell来操作的，这里应该是老版本文档的遗留) Pacemaker Pacemaker来实现资源管理 crm shell 来显示并修改配置文件 示例集群会使用以下软件: 本文档的主要目的是提供一站式指南，教您如何使用Pacemaker创建一个主/备模式的集群并把它转换到主/主模式。 