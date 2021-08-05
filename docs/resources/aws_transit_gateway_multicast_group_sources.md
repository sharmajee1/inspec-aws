---
title: About the aws_transit_gateway_multicast_group_sources Resource
platform: aws
---

# aws\_transit\_gateway\_multicast\_group\_sources

Use the `aws_transit_gateway_multicast_group_sources` InSpec audit resource to test properties of a plural AWS EC2 TransitGatewayMulticastGroupSource.

The AWS::EC2::TransitGatewayMulticastGroupSource resource registers sources (network interfaces) with the specified transit gateway multicast domain.

## Syntax

Ensure that transit gateway multicast group Source exists.

    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "tgw-mcast-domain-1234567890") do
      it { should exist }
    end

## Parameters

`transit_gateway_multicast_domain_id` _(required)_

The transit_gateway_multicast_domain_id is the ID of the multicast domain transit gateway.

For additional information, see the [AWS documentation on AWS EC2 TransitGatewayMulticastGroupSource](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-transitgatewaymulticastgroupsource.html).

## Properties

| Property | Description | Fields |
| --- | --- | --- |
| group_ip_addresses | The IP address of the transit gateway multicast group. | group_ip_address |
| transit_gateway_attachment_ids | The attachment id of the transit gateway. | transit_gateway_attachment_id |
| subnet_ids | The ID of the subnet. | subnet_id |
| resource_ids | The ID of the resource. | resource_id |
| resource_types | The type of the resource. | resource_type |
| resource_owner_ids | The Owner ID of the resource. | resource_owner_id |
| network_interface_ids | The network interface ID of the resource. | network_interface_id |
| group_members | The resource is a group member. Valid values are true and false. | group_member |
| group_sources | The resource is a group source. Valid values are true and false. | group_source |
| member_types | The member type. Valid values are igmp and static. | member_type |
| source_types | The source type. Valid values are igmp and static. | source_type |

## Examples

### Ensure a transit gateway attachment id is available.
    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "tgw-mcast-domain-1234567890") do
      its('transit_gateway_attachment_ids') { should include 'tgw-attach-1234567890' }
    end

### Ensure that the group Sources are available.
    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "tgw-mcast-domain-1234567890") do
        its('group_Sources') { should include true }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `search` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "tgw-mcast-domain-1234567890") do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "dummy") do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_transit_gateway_multicast_group_sources(transit_gateway_multicast_domain_id: "tgw-mcast-domain-1234567890") do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `ec2:client:search_transit_gateway_multicast_groups` action with `Effect` set to `Allow`.