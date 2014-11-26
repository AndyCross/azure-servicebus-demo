<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudService1" generation="1" functional="0" release="0" Id="ceb314e6-7803-47fa-bfac-76d8cb146044" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudService1Group" generation="1" functional="0" release="0">
      <settings>
        <aCS name="BlobWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapBlobWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="BlobWriterInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapBlobWriterInstances" />
          </maps>
        </aCS>
        <aCS name="MessageCreator:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapMessageCreator:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="MessageCreator:SB.Rangers" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapMessageCreator:SB.Rangers" />
          </maps>
        </aCS>
        <aCS name="MessageCreatorInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapMessageCreatorInstances" />
          </maps>
        </aCS>
        <aCS name="SQLWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapSQLWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="SQLWriter:SB.Rangers.ReadOnly" defaultValue="">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapSQLWriter:SB.Rangers.ReadOnly" />
          </maps>
        </aCS>
        <aCS name="SQLWriterInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService1/AzureCloudService1Group/MapSQLWriterInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapBlobWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService1/AzureCloudService1Group/BlobWriter/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapBlobWriterInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/BlobWriterInstances" />
          </setting>
        </map>
        <map name="MapMessageCreator:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreator/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapMessageCreator:SB.Rangers" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreator/SB.Rangers" />
          </setting>
        </map>
        <map name="MapMessageCreatorInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreatorInstances" />
          </setting>
        </map>
        <map name="MapSQLWriter:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriter/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapSQLWriter:SB.Rangers.ReadOnly" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriter/SB.Rangers.ReadOnly" />
          </setting>
        </map>
        <map name="MapSQLWriterInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriterInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="BlobWriter" generation="1" functional="0" release="0" software="C:\src\azure-servicebus-demo\AzureCloudService1\AzureCloudService1\csx\Debug\roles\BlobWriter" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;BlobWriter&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BlobWriter&quot; /&gt;&lt;r name=&quot;MessageCreator&quot; /&gt;&lt;r name=&quot;SQLWriter&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/BlobWriterInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/BlobWriterUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/BlobWriterFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="MessageCreator" generation="1" functional="0" release="0" software="C:\src\azure-servicebus-demo\AzureCloudService1\AzureCloudService1\csx\Debug\roles\MessageCreator" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="SB.Rangers" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MessageCreator&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BlobWriter&quot; /&gt;&lt;r name=&quot;MessageCreator&quot; /&gt;&lt;r name=&quot;SQLWriter&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreatorInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreatorUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/MessageCreatorFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="SQLWriter" generation="1" functional="0" release="0" software="C:\src\azure-servicebus-demo\AzureCloudService1\AzureCloudService1\csx\Debug\roles\SQLWriter" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="SB.Rangers.ReadOnly" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SQLWriter&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;BlobWriter&quot; /&gt;&lt;r name=&quot;MessageCreator&quot; /&gt;&lt;r name=&quot;SQLWriter&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriterInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriterUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService1/AzureCloudService1Group/SQLWriterFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="MessageCreatorUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="SQLWriterUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="BlobWriterUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="BlobWriterFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="MessageCreatorFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="SQLWriterFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="BlobWriterInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="MessageCreatorInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="SQLWriterInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>