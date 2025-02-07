��    9      �  O   �      �  �   �  ;  �  @    c  E
  {  �  }   %  �  �  �   s  Q  �  �   G  �  /  U  �    G"  v  b#  �  �$  �  �&  C   ')  $   k)  �   �)     :*  �   L*  /   �*  W    +  `   X+  "   �+  $   �+  8   ,  L  :,  z   �-  i   .  R   l.  x   �.    8/  �   S1  f   L2  o   �2  c   #3     �3  ,   �3     �3  #   �3  J   4  M  S4  *   �5  �  �5  �   �7  �  C8  '  /:  5   W;  +  �;  G   �>  7   ?  Q   9?  �   �?  @   ?@  %   �@    �@  �   �A  ;  �B  @  �D  c  G  {  xI  }   �L  �  rM  �   BT  Q  �T  �   W  �  �W  U  �Z    _  v  1`  �  �a  �  fc  C   �e  $   :f  �   _f     �f  z   g  9   g  H   �g  g   h     jh     �h  8   �h    �h  Z   �i  j   ?j  T   �j  �   �j  �  �k  �   Sm  d   #n  Z   �n  [   �n     ?o  $   Vo     {o  *   �o  )   �o  �   �o  >   �p  P  .q  �   r    s  �   &t  "   u  �  @u  9   �w  6   )x  N   `x  �   �x  ?   Ay  *   �y         !       2   3                           *   $             7   )   	          &       /                 #       '   1       ,   
      9                                               (                        5   +   0          "      6   %          -   4   8   .                    
<userinput>crm configure primitive ClusterIP ocf:heartbeat:IPaddr2 \ </userinput>
        <userinput>params ip=192.168.122.101 cidr_netmask=32 \ </userinput>
        <userinput>op monitor interval=30s</userinput>
 
[root@pcmk-1 ~]# <userinput>/etc/init.d/corosync start</userinput>
<emphasis>Starting Corosync Cluster Engine (corosync): [ OK ]</emphasis>
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:41:23 2009
Stack: openais
Current DC: pcmk-2 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ <emphasis>pcmk-1</emphasis> pcmk-2 ]

ClusterIP        (ocf::heartbeat:IPaddr):        Started <emphasis>pcmk-2</emphasis>
 
[root@pcmk-1 ~]# <userinput>/etc/init.d/corosync start</userinput>
<emphasis>Starting Corosync Cluster Engine (corosync): [ OK ]</emphasis>      
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:32:13 2009
Stack: openais
Current DC: pcmk-2 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============
Online: [ <emphasis>pcmk-1</emphasis> pcmk-2 ]

ClusterIP        (ocf::heartbeat:IPaddr):        <emphasis>Started pcmk-1</emphasis>
 
[root@pcmk-1 ~]# <userinput>crm configure property no-quorum-policy=ignore</userinput>
[root@pcmk-1 ~]# <userinput>crm configure show </userinput>
node pcmk-1
node pcmk-2
primitive ClusterIP ocf:heartbeat:IPaddr2 \
        params ip="192.168.122.101" cidr_netmask="32" \
        op monitor interval="30s"
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
        <emphasis>no-quorum-policy="ignore"</emphasis>
 
[root@pcmk-1 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
<emphasis>primitive ClusterIP ocf:heartbeat:IPaddr2 \</emphasis>
<emphasis> params ip="192.168.122.101" cidr_netmask="32" \</emphasis>
<emphasis> op monitor interval="30s"</emphasis>
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:23:48 2009
Stack: openais
Current DC: pcmk-1 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-1 pcmk-2 ]
<emphasis>ClusterIP (ocf::heartbeat:IPaddr): Started</emphasis> pcmk-1
 
[root@pcmk-1 ~]# <userinput>crm ra classes</userinput>
heartbeat
lsb
<emphasis>ocf / heartbeat pacemaker</emphasis>
stonith
 
[root@pcmk-1 ~]# <userinput>crm ra list ocf pacemaker</userinput>
ClusterMon     Dummy          Stateful       SysInfo        SystemHealth   controld
ping           pingd          
[root@pcmk-1 ~]# <userinput>crm ra list ocf heartbeat</userinput>
AoEtarget              AudibleAlarm           ClusterMon             Delay
Dummy                  EvmsSCC                Evmsd                  Filesystem
ICP                    IPaddr                 IPaddr2                IPsrcaddr
LVM                    LinuxSCSI              MailTo                 ManageRAID
ManageVE               Pure-FTPd              Raid1                  Route
SAPDatabase            SAPInstance            SendArp                ServeRAID
SphinxSearchDaemon     Squid                  Stateful               SysInfo
VIPArip                VirtualDomain          WAS                    WAS6
WinPopup               Xen                    Xinetd                 anything
apache                 db2                    drbd                   eDir88
iSCSILogicalUnit       iSCSITarget            ids                    iscsi
ldirectord             mysql                  mysql-proxy            nfsserver
oracle                 oralsnr                pgsql                  pingd
portblock              rsyncd                 scsi2reservation       sfex
tomcat                 vmware                 
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>crm resource status ClusterIP</userinput>
resource ClusterIP is running on: pcmk-1
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>crm_verify -L</userinput>
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: <emphasis>Resource start-up disabled since no STONITH resources have been defined</emphasis>
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: Either configure some or disable STONITH with the stonith-enabled option
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: NOTE: Clusters with shared data need STONITH to ensure data integrity
<emphasis>Errors found during check: config not valid</emphasis>
  -V may provide more details
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>ssh pcmk-1 -- /etc/init.d/corosync stop</userinput>
<emphasis>Stopping Corosync Cluster Engine (corosync): [ OK ]</emphasis>
<emphasis>Waiting for services to unload: [ OK ]</emphasis>
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>ssh pcmk-1 -- /etc/init.d/corosync stop</userinput>
Stopping Corosync Cluster Engine (corosync):               [  OK  ]
Waiting for services to unload:                            [  OK  ]
[root@pcmk-1 ~]# <userinput>ssh pcmk-2 -- crm_mon -1</userinput>
============
Last updated: Fri Aug 28 15:39:38 2009
Stack: openais
Current DC: pcmk-2 - partition WITHOUT quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>

ClusterIP        (ocf::heartbeat:IPaddr):        <emphasis>Started pcmk-2</emphasis>
 
[root@pcmk-2 ~]# <userinput>crm configure show xml</userinput>
&lt;?xml version="1.0" ?&gt;
&lt;cib admin_epoch="0" crm_feature_set="3.0.1" dc-uuid="pcmk-1" epoch="13" have-quorum="1" num_updates="7" validate-with="pacemaker-1.0"&gt;
  &lt;configuration&gt;
    &lt;crm_config&gt;
      &lt;cluster_property_set id="cib-bootstrap-options"&gt;
        &lt;nvpair id="cib-bootstrap-options-dc-version" name="dc-version" value="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7"/&gt;
        &lt;nvpair id="cib-bootstrap-options-cluster-infrastructure" name="cluster-infrastructure" value="openais"/&gt;
        &lt;nvpair id="cib-bootstrap-options-expected-quorum-votes" name="expected-quorum-votes" value="2"/&gt;
      &lt;/cluster_property_set&gt;
    &lt;/crm_config&gt;
    &lt;rsc_defaults/&gt;
    &lt;op_defaults/&gt;
    &lt;nodes&gt;
      &lt;node id="pcmk-1" type="normal" uname="pcmk-1"/&gt;
      &lt;node id="pcmk-2" type="normal" uname="pcmk-2"/&gt;
    &lt;/nodes&gt;
    &lt;resources/&gt;
    &lt;constraints/&gt;
  &lt;/configuration&gt;
&lt;/cib&gt;
 
[root@pcmk-2 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2"
 
[root@pcmk-2 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:27:35 2009
Stack: openais
Current DC: pcmk-2 - <emphasis>partition WITHOUT quorum</emphasis>
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>
 
[root@pcmk-2 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:30:18 2009
Stack: openais
Current DC: pcmk-2 - <emphasis>partition WITHOUT quorum</emphasis>
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============
Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>

<emphasis>ClusterIP (ocf::heartbeat:IPaddr): Started pcmk-2</emphasis>
 
crm configure rsc_defaults resource-stickiness=100
[root@pcmk-2 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
primitive ClusterIP ocf:heartbeat:IPaddr2 \
        params ip="192.168.122.101" cidr_netmask="32" \
        op monitor interval="30s"
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
        no-quorum-policy="ignore"
<emphasis>rsc_defaults $id="rsc-options" \</emphasis>
<emphasis> resource-stickiness="100"</emphasis>
 <userinput>crm configure property stonith-enabled=false</userinput> <userinput>crm_verify -L</userinput> A cluster is said to have quorum when more than half the known or expected nodes are online, or for the mathematically inclined, whenever the following equation is true: Adding a Resource After a few moments, the cluster will start the IP address on the remaining node. Note that the cluster still does not have quorum. As you can see, the tool has found some errors. Before we make any changes, its a good idea to check the validity of the configuration. Being a high-availability cluster, we should test failover of our new resource before moving on. Creating an Active/Passive Cluster Exploring the Existing Configuration First, find the node on which the IP address is running. For now, we will disable this feature and configure it later in the Configuring STONITH section. It is important to note that the use of STONITH is highly encouraged, turning it off tells the cluster to simply pretend that failed nodes are safely powered off. Some vendors will even refuse to support clusters that have it disabled. For those that are not of afraid of XML, you can see the raw configuration by appending “xml” to the previous command. Here we see something that some may consider surprising, the IP is back running at its original location! However when we bring pcmk-1 back online, ClusterIP now remains running on pcmk-2. If we now retry the failover test, we see that as expected ClusterIP still moves to pcmk-2 when pcmk-1 is taken offline. In order to guarantee the safety of your data <footnote> <para> If the data is corrupt, there is little point in continuing to make it available </para> </footnote> , Pacemaker ships with STONITH <footnote> <para> A common node fencing mechanism. Used to ensure data integrity by powering off “bad” nodes. </para> </footnote> enabled. However it also knows when no STONITH configuration has been supplied and reports this as a problem (since the cluster would not be able to make progress if a situation requiring node fencing arose). In some circumstances it is highly desirable to prevent healthy resources from being moved around the cluster. Move resources almost always requires a period of downtime and for complex services like Oracle databases, this period can be quite long. Now simulate node recovery by restarting the cluster stack on pcmk-1 and check the cluster’s status. Now verify that the IP resource has been added and display the cluster’s status to see that it is now active. Once Corosync is no longer running, go to the other node and check the cluster status with crm_mon. Perform a Failover Prevent Resources from Moving after Recovery Quorum and Two-Node Clusters Shut down Corosync on that machine. The chosen address must not be one already associated with a physical node The first thing we should do is configure an IP address. Regardless of where the cluster service(s) are running, we need a consistent address to contact them on. Here I will choose and add 192.168.122.101 as the floating address, give it the imaginative name ClusterIP and tell the cluster to check that its running every 30 seconds. The last XML you’ll see in this document The other important piece of information here is ocf:heartbeat:IPaddr2. This tells Pacemaker three things about the resource you want to add. The first field, ocf, is the standard to which the resource script conforms to and where to find it. The second field is specific to OCF resources and tells the cluster which namespace to find the resource script in, in this case heartbeat. The last field indicates the name of the resource script. There are three things to notice about the cluster’s current state. The first is that, as expected, pcmk-1 is now offline. However we can also see that ClusterIP isn’t running anywhere! Therefore a two-node cluster only has quorum when both nodes are running, which is no longer the case for our cluster. This would normally make the creation of a two-node cluster pointless<footnote> <para> Actually some would argue that two-node clusters are always pointless, but that is an argument for another time. </para> </footnote>, however it is possible to control how Pacemaker behaves when quorum is lost. In particular, we can tell the cluster to simply ignore quorum altogether. This is because the cluster no longer has quorum, as can be seen by the text “partition WITHOUT quorum” (emphasised green) in the output above. In order to reduce the possibility of data corruption, Pacemaker’s default behavior is to stop all resources if the cluster does not have quorum. This is what the base configuration should look like. To address this, Pacemaker has the concept of resource stickiness which controls how much a service prefers to stay running where it is. You may like to think of it as the “cost” of any downtime. By default, Pacemaker assumes there is zero cost associated with moving resources and will do so to achieve “optimal<footnote> <para> It should be noted that Pacemaker’s definition of optimal may not always agree with that of a human’s. The order in which Pacemaker processes lists of resources and nodes create implicit preferences (required in order to create a stabile solution) in situations where the administrator had not explicitly specified some. </para> </footnote>” resource placement. We can specify a different stickiness for every resource, but it is often sufficient to change the default. To disable STONITH, we set the stonith-enabled cluster option to false. To obtain a list of the available resource classes, run To then find all the OCF resource agents provided by Pacemaker and Heartbeat, run When Pacemaker starts up, it automatically records the number and details of the nodes in the cluster as well as which stack is being used and the version of Pacemaker being used. With the new cluster option set, the configuration is now valid. total_nodes - 1 &lt; 2 * active_nodes Project-Id-Version: 0
POT-Creation-Date: 2010-12-15T23:32:36
PO-Revision-Date: 2010-12-16 00:24+0800
Last-Translator: Charlie Chen <laneovcc@gmail.com>
Language-Team: None
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
<userinput>crm configure primitive ClusterIP ocf:heartbeat:IPaddr2 \ </userinput>
        <userinput>params ip=192.168.122.101 cidr_netmask=32 \ </userinput>
        <userinput>op monitor interval=30s</userinput>
 
[root@pcmk-1 ~]# <userinput>/etc/init.d/corosync start</userinput>
<emphasis>Starting Corosync Cluster Engine (corosync): [ OK ]</emphasis>
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:41:23 2009
Stack: openais
Current DC: pcmk-2 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ <emphasis>pcmk-1</emphasis> pcmk-2 ]

ClusterIP        (ocf::heartbeat:IPaddr):        Started <emphasis>pcmk-2</emphasis>
 
[root@pcmk-1 ~]# <userinput>/etc/init.d/corosync start</userinput>
<emphasis>Starting Corosync Cluster Engine (corosync): [ OK ]</emphasis>      
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:32:13 2009
Stack: openais
Current DC: pcmk-2 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============
Online: [ <emphasis>pcmk-1</emphasis> pcmk-2 ]

ClusterIP        (ocf::heartbeat:IPaddr):        <emphasis>Started pcmk-1</emphasis>
 
[root@pcmk-1 ~]# <userinput>crm configure property no-quorum-policy=ignore</userinput>
[root@pcmk-1 ~]# <userinput>crm configure show </userinput>
node pcmk-1
node pcmk-2
primitive ClusterIP ocf:heartbeat:IPaddr2 \
        params ip="192.168.122.101" cidr_netmask="32" \
        op monitor interval="30s"
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
        <emphasis>no-quorum-policy="ignore"</emphasis>
 
[root@pcmk-1 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
<emphasis>primitive ClusterIP ocf:heartbeat:IPaddr2 \</emphasis>
<emphasis> params ip="192.168.122.101" cidr_netmask="32" \</emphasis>
<emphasis> op monitor interval="30s"</emphasis>
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
[root@pcmk-1 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:23:48 2009
Stack: openais
Current DC: pcmk-1 - partition with quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-1 pcmk-2 ]
<emphasis>ClusterIP (ocf::heartbeat:IPaddr): Started</emphasis> pcmk-1
 
[root@pcmk-1 ~]# <userinput>crm ra classes</userinput>
heartbeat
lsb
<emphasis>ocf / heartbeat pacemaker</emphasis>
stonith
 
[root@pcmk-1 ~]# <userinput>crm ra list ocf pacemaker</userinput>
ClusterMon     Dummy          Stateful       SysInfo        SystemHealth   controld
ping           pingd          
[root@pcmk-1 ~]# <userinput>crm ra list ocf heartbeat</userinput>
AoEtarget              AudibleAlarm           ClusterMon             Delay
Dummy                  EvmsSCC                Evmsd                  Filesystem
ICP                    IPaddr                 IPaddr2                IPsrcaddr
LVM                    LinuxSCSI              MailTo                 ManageRAID
ManageVE               Pure-FTPd              Raid1                  Route
SAPDatabase            SAPInstance            SendArp                ServeRAID
SphinxSearchDaemon     Squid                  Stateful               SysInfo
VIPArip                VirtualDomain          WAS                    WAS6
WinPopup               Xen                    Xinetd                 anything
apache                 db2                    drbd                   eDir88
iSCSILogicalUnit       iSCSITarget            ids                    iscsi
ldirectord             mysql                  mysql-proxy            nfsserver
oracle                 oralsnr                pgsql                  pingd
portblock              rsyncd                 scsi2reservation       sfex
tomcat                 vmware                 
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>crm resource status ClusterIP</userinput>
resource ClusterIP is running on: pcmk-1
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>crm_verify -L</userinput>
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: <emphasis>Resource start-up disabled since no STONITH resources have been defined</emphasis>
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: Either configure some or disable STONITH with the stonith-enabled option
crm_verify[2195]: 2009/08/27_16:57:12 ERROR: unpack_resources: NOTE: Clusters with shared data need STONITH to ensure data integrity
<emphasis>Errors found during check: config not valid</emphasis>
  -V may provide more details
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>ssh pcmk-1 -- /etc/init.d/corosync stop</userinput>
<emphasis>Stopping Corosync Cluster Engine (corosync): [ OK ]</emphasis>
<emphasis>Waiting for services to unload: [ OK ]</emphasis>
[root@pcmk-1 ~]#
 
[root@pcmk-1 ~]# <userinput>ssh pcmk-1 -- /etc/init.d/corosync stop</userinput>
Stopping Corosync Cluster Engine (corosync):               [  OK  ]
Waiting for services to unload:                            [  OK  ]
[root@pcmk-1 ~]# <userinput>ssh pcmk-2 -- crm_mon -1</userinput>
============
Last updated: Fri Aug 28 15:39:38 2009
Stack: openais
Current DC: pcmk-2 - partition WITHOUT quorum
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>

ClusterIP        (ocf::heartbeat:IPaddr):        <emphasis>Started pcmk-2</emphasis>
 
[root@pcmk-2 ~]# <userinput>crm configure show xml</userinput>
&lt;?xml version="1.0" ?&gt;
&lt;cib admin_epoch="0" crm_feature_set="3.0.1" dc-uuid="pcmk-1" epoch="13" have-quorum="1" num_updates="7" validate-with="pacemaker-1.0"&gt;
  &lt;configuration&gt;
    &lt;crm_config&gt;
      &lt;cluster_property_set id="cib-bootstrap-options"&gt;
        &lt;nvpair id="cib-bootstrap-options-dc-version" name="dc-version" value="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7"/&gt;
        &lt;nvpair id="cib-bootstrap-options-cluster-infrastructure" name="cluster-infrastructure" value="openais"/&gt;
        &lt;nvpair id="cib-bootstrap-options-expected-quorum-votes" name="expected-quorum-votes" value="2"/&gt;
      &lt;/cluster_property_set&gt;
    &lt;/crm_config&gt;
    &lt;rsc_defaults/&gt;
    &lt;op_defaults/&gt;
    &lt;nodes&gt;
      &lt;node id="pcmk-1" type="normal" uname="pcmk-1"/&gt;
      &lt;node id="pcmk-2" type="normal" uname="pcmk-2"/&gt;
    &lt;/nodes&gt;
    &lt;resources/&gt;
    &lt;constraints/&gt;
  &lt;/configuration&gt;
&lt;/cib&gt;
 
[root@pcmk-2 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2"
 
[root@pcmk-2 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:27:35 2009
Stack: openais
Current DC: pcmk-2 - <emphasis>partition WITHOUT quorum</emphasis>
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============

Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>
 
[root@pcmk-2 ~]# <userinput>crm_mon</userinput>
============
Last updated: Fri Aug 28 15:30:18 2009
Stack: openais
Current DC: pcmk-2 - <emphasis>partition WITHOUT quorum</emphasis>
Version: 1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7
2 Nodes configured, 2 expected votes
1 Resources configured.
============
Online: [ pcmk-2 ]
<emphasis>OFFLINE: [ pcmk-1 ]</emphasis>

<emphasis>ClusterIP (ocf::heartbeat:IPaddr): Started pcmk-2</emphasis>
 
crm configure rsc_defaults resource-stickiness=100
[root@pcmk-2 ~]# <userinput>crm configure show</userinput>
node pcmk-1
node pcmk-2
primitive ClusterIP ocf:heartbeat:IPaddr2 \
        params ip="192.168.122.101" cidr_netmask="32" \
        op monitor interval="30s"
property $id="cib-bootstrap-options" \
        dc-version="1.0.5-462f1569a43740667daf7b0f6b521742e9eb8fa7" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
        no-quorum-policy="ignore"
<emphasis>rsc_defaults $id="rsc-options" \</emphasis>
<emphasis> resource-stickiness="100"</emphasis>
 <userinput>crm configure property stonith-enabled=false</userinput> <userinput>crm_verify -L</userinput> 当有半数以上的节点在线时，这个集群就认为自己拥有法定人数了，是“合法”的，换而言之就是下面的公式: 添加一个资源 过了一会，集群会在剩下的那个节点上启动这个IP。请注意集群现在依然没有达到法定人数。 就像你看到的，这个工具发现了一些错误。 在我们做出任何改变之前，我们最好检查下配置文件。 作为一个高可用的集群，我们在继续本文档之前，我们要需要测试失效备援 。 创建一个主/备集群 浏览现有配置 首先，找到IP资源现在在哪个节点上运行。 目前，我们禁用这个特性，然后在 配置STONISH 章节来配置它。这里要指出，使用STONITH是非常有必要的。关闭这个特性就是告诉集群:假装故障的节点已经安全的关机了。一些供应商甚至不允许这个特性被关闭。 如果有谁想看看XML格式的，你可以添加xml选项来看到原始的配置文件 现在我们可以看到让某些人惊奇的事情，IP资源回到原来那个节点(pcmk-1)上去了。 但是当我们把pcmk-1恢复在线后，ClusterIP现在还是跑在pcmk-2上面。 现在我们重新尝试失效援备测试，我们可以看到，正如我们所料，当pcmk-1不在线的时候ClusterIP还是移动到了pcmk-2 为了确保您数据的安全性 <footnote> <para>如果数据是损坏的，那保证它的可用性是没有意义的</para> </footnote> ，请使用配备STONITH <footnote> <para> 一个常见的隔离手段。用关掉坏节点电源的办法来保证数据完整 </para> </footnote>的Pacemaker。但是当没有配置STONITH的时候也会报这个错误(因为当集群中某个节点需要被隔离的时候，集群就无法工作了)。 一些环境中会要求尽量避免资源在节点之间移动。移动资源通常意味着一段时间内无法提供服务，某些复杂的服务，比如Oracle数据库，这个时间可能会很长。 现在模拟节点恢复，我们启动 pcmk-1 上面的Corosync服务，然后检查集群状态。 现在检查下IP 资源是不是已经添加了，并且看看是否处在可用状态。 当Corosync停止运行以后，我们到另外一个节点用crm_mon来检查集群状态.  做一次失效备援 防止资源在节点恢复后移动 法定人数和双节点集群 关闭那个节点上面的Corosync服务: 选择的IP地址不能被节点所占用 首先要做的是配置一个IP地址，不管集群服务在哪运行，我们要一个固定的地址来提供服务。在这里我选择192.168.122.101作为浮动IP，给它取一个好记的名字 ClusterIP 并且告诉集群 每30秒检查它一次 这是本文档最后一次显示XML。(作者怨念很深啊) 另外一个重要的信息是 ocf:heartbeat:IPaddr2。这告诉Pacemaker三件事情，第一个部分，ocf，指明了这个资源采用的标准(类型)以及在哪能找到它。第二个部分标明这个资源脚本的在OCF中的名字空间，在这个例子中是heartbeat。最后一个部分指明了资源脚本的名称。 关于集群状态，我们有三个地方需要注意，首先，如我们所料pcmk-1已经下线了，然而我们发现ClusterIP不在任何地方运行！ 因此在双节点的集群中，只有当两者都在线时才是合法的。 这个规则会让 双节点的集群 毫无意义，但是我们可以控制Pacemaker发现集群达不到法定人数时候的行为。简单来说，我们告诉集群忽略它 。 这是因为集群已经达不到“法定人数”了，就像我们看到的“partition WITHOUT quorum” (用绿色强调的)。为了避免数据遭到破坏，当Pacemaker发现集群达不到法定人数时，就会停止所有的资源。 这是初始配置文件的模样: 为了达到这个效果，Pacemaker 有一个叫做 资源黏性值 的概念，它能够控制一个服务(资源)有多想呆在它正在运行的节点上。你可以把它认为是无法提供服务的“代价”<footnote> <para> 这里要注意的是Pacemaker定义的代价跟人们所想的不一样。如果管理员没有明确的指定参数(创建稳定环境所必须的)，那么资源个节点在Pacemaker处理列表中的顺序会隐式地创建参数 </para> </footnote>”。 Pacemaker为了达到最优分布各个资源的目的，默认设置这个值为0。我们可以为每个资源定义不同的黏性值，但一般来说，更改默认黏性值就够了。 我们将 stonith-enabled设置为 false 来关闭STONITH 可以运行下面的命令来获得可用的资源类 找到OCF中Pacemaker和Heartbeat提供的资源脚本，运行下面的命令 当Pacemaker启动的时候，它会自动记录节点的数量和详细信息，以及基层软件(本文中是corosync)和Pacemaker的版本。 设置完这个选项以后，校验配置文件就正常了。 总节点数 - 1 &#60; 2 * 可用的节点 