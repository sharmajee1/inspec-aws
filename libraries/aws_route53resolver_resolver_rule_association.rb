# frozen_string_literal: true

require 'aws_backend'

class AWSRoute53ResolverResolverRuleAssociation < AwsResourceBase
  name 'aws_route53resolver_resolver_rule_association'
  desc ''

  example "
    describe aws_route53resolver_resolver_rule_association(resolver_rule_association_id: 'resolver_rule_association_id_test') do
      it { should exist }
    end
  "

  def initialize(opts = {})
    opts = { resolver_rule_association_id: opts } if opts.is_a?(String)
    super(opts)
    validate_parameters(required: %i(resolver_rule_association_id))
    raise ArgumentError, "#{@__resource_name__}: resource_share_arn must be provided" unless opts[:resolver_rule_association_id] && !opts[:resolver_rule_association_id].empty?
    @display_name = opts[:resolver_rule_association_id]
    catch_aws_errors do
      resp = @aws.route53resolver_client.get_resolver_rule_association({ resolver_rule_association_id: opts[:resolver_rule_association_id] })
      @res = resp.resolver_rule_association.to_h
      create_resource_methods(@res)
    end
  end

  def id
    return nil unless exists?
    @res[:resolver_rule_association_id]
  end

  def exists?
    !@res.nil? && !@res.empty?
  end

  def encrypted?
    @res[:encrypted]
  end

  def to_s
    "resolver_rule_association_id: #{@display_name}"
  end
end