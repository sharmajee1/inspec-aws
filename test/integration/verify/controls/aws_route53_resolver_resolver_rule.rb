resolver_rule_id= attribute("resolver_rule_id", default: "", description: "")
resolver_rule_arn = attribute("resolver_rule_arn", default: "", description: "")
resolver_rule_type = attribute("resolver_rule_type", default: "", description: "")


control 'aws-route53-resolver-resolver-rule-1.0' do
    impact 1.0
    title 'Describes the resolver rule of the route53.'
  
    describe aws_route53resolver_resolver_rule(resolver_rule_id: resolver_rule_id) do
        it { should exist }
    end

    describe aws_route53resolver_resolver_rule(resolver_rule_id: resolver_rule_id) do
        its('id') { should eq resolver_rule_id }
        its('arn') { should eq resolver_rule_arn }
        its('domain_name') { should eq "subdomain.example.com."}
        its('status') { should eq "COMPLETE" }
        its('rule_type') { should eq resolver_rule_type }
        its('target_ips') { should be_empty }
        its('target_ips.first.ip') { should be_empty }
        its('target_ips.first.port') { should be_empty }
        its('resolver_endpoint_id') { should be_empty }
        its('share_status') { should eq "NOT_SHARED" }
        its('modification_time') { should be_empty }
    end
  
    describe aws_route53resolver_resolver_rule(resolver_rule_id: 'dumy') do
        it { should_not exist }
    end
end